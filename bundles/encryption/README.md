# Encryption

This bundle uses [Mozilla SOPS](https://github.com/mozilla/sops),
[Age](https://github.com/FiloSottile/age) to manage encrypted files in this
dotfiles repo. It also uses a free [Doppler](https://www.doppler.com/) account,
if available, to store the encryption key outside of the repo (with a script to
retrieve it on install).

## Manual Steps
1. Sign up for a Doppler account
