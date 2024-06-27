cd /opt
git clone --no-checkout https://github.com/Cazeho/RBA.git
cd RBA/
git sparse-checkout init --cone
git sparse-checkout set attack/simulation
git checkout
chmod +x /opt/RBA/attack/simulation/install.sh
/opt/RBA/attack/simulation/install.sh
cd /opt/RBA/attack/simulation
