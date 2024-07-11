import re

def parse_mimikatz_output(output):
    sessions = []
    current_session = None
    authentication_block = False

    for line in output.splitlines():
        if line.startswith('Authentication Id'):
            if current_session:
                sessions.append(current_session)
            current_session = {'Authentication Id': line.split(':')[1].strip()}
            authentication_block = True
        elif authentication_block:
            if line.startswith('Session'):
                current_session['Session'] = line.split(':')[1].strip()
            elif line.startswith('User Name'):
                current_session['User Name'] = line.split(':')[1].strip()
            elif line.startswith('Domain'):
                current_session['Domain'] = line.split(':')[1].strip()
            elif line.startswith('Logon Server'):
                current_session['Logon Server'] = line.split(':')[1].strip()
            elif line.startswith('Logon Time'):
                current_session['Logon Time'] = line.split(':')[1].strip()
            elif line.startswith('SID'):
                current_session['SID'] = line.split(':')[1].strip()
            elif 'msv :' in line:
                current_session['msv'] = []
            elif '[00000003] Primary' in line:
                current_session['msv'].append(line.strip())
            elif '* Username :' in line:
                current_session['msv'].append(line.strip())
            elif '* Domain   :' in line:
                current_session['msv'].append(line.strip())
            elif '* NTLM     :' in line:
                current_session['msv'].append(line.strip())
            elif '* SHA1     :' in line:
                current_session['msv'].append(line.strip())
            elif '* DPAPI    :' in line:
                current_session['msv'].append(line.strip())
            elif line.startswith('        tspkg :') or line.startswith('        wdigest :') or line.startswith('        kerberos :'):
                current_session['msv'].append(line.strip())
            elif line.startswith('mimikatz(commandline) # exit'):
                if current_session:
                    sessions.append(current_session)
                authentication_block = False

    return sessions

def read_mimikatz_output_from_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def extract_user_ntlm(parsed_output):
    user_ntlm_list = []
    for session in parsed_output:
        user_name = None
        ntlm_hash = None
        for item in session.get('msv', []):
            if item.startswith('* Username :'):
                user_name = item.split(':')[1].strip()
            elif item.startswith('* NTLM     :'):
                ntlm_hash = item.split(':')[1].strip()
        if user_name and ntlm_hash:
            user_ntlm_list.append((user_name, ntlm_hash))
    return user_ntlm_list

file_path = 'mimikatz.log'
mimikatz_output = read_mimikatz_output_from_file(file_path)
parsed_output = parse_mimikatz_output(mimikatz_output)
user_ntlm_list = extract_user_ntlm(parsed_output)

for user, ntlm in user_ntlm_list:
    print(f"User: {user}, NTLM Hash: {ntlm}")
