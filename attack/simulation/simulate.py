import os
import yaml
import argparse
import subprocess

PLAYBOOKS_DIR = 'roles'

def list_playbooks():
    playbooks = [f.name for f in os.scandir(PLAYBOOKS_DIR) if f.is_dir()]
    return playbooks

def check_playbook(playbook):
    playbook_path = os.path.join(PLAYBOOKS_DIR, playbook, 'tasks', 'main.yml')
    if os.path.exists(playbook_path):
        print(f"Playbook '{playbook}' exists.")
    else:
        print(f"Playbook '{playbook}' does not exist.")

def run_playbook(playbook):
    subprocess.run(['ansible-playbook', f'roles/{playbook}/tasks/main.yml'], check=True)

def run_all_playbooks():
    subprocess.run(['ansible-playbook', 'site.yml'], check=True)

def configure_all_yml(config):
    with open('group_vars/all.yml', 'w') as f:
        yaml.dump(config, f)

def main():
    parser = argparse.ArgumentParser(description="Manage Ansible Playbooks")
    parser.add_argument('-l', '--list', action='store_true', help='List all available playbooks')
    parser.add_argument('-c', '--check', type=str, help='Check if a specific playbook exists')
    parser.add_argument('-r', '--run', type=str, help='Run a specific playbook')
    parser.add_argument('-a', '--all', action='store_true', help='Run all playbooks')
    parser.add_argument('-s', '--set', nargs='+', help='Set environment variables for all.yml')

    args = parser.parse_args()

    if args.list:
        playbooks = list_playbooks()
        print("Available playbooks:")
        for playbook in playbooks:
            print(f"  - {playbook}")
    
    if args.check:
        check_playbook(args.check)
    
    if args.run:
        run_playbook(args.run)
    
    if args.all:
        run_all_playbooks()
    
    if args.set:
        config = {}
        for item in args.set:
            key, value = item.split('=')
            config[key] = value
        configure_all_yml(config)
        print("Environment variables set in group_vars/all.yml")

if __name__ == "__main__":
    main()

