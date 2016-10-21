WEB_PORT = 8000
GIT_PORT = 8001

GIT_REPO_DIR = '/home/git'
DOMAIN_NAME = 'raviqqe.com'

cert_dir = File.join '/usr/local/etc/letsencrypt/live', DOMAIN_NAME
CERT_PATH = File.join cert_dir, 'fullchain.pem'
PRIV_KEY_PATH = File.join cert_dir, 'privkey.pem'
