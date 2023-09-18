# raspi-pico-docker

Rasberry Pi Pico SDK開発環境をLinux上に一発で構築するDockerfile

# 動作確認済み環境
Ubuntu 22.04 in WSL in Windows 10

# Dockerfile概要

1. ベース環境`ubuntu:latest`
2. NOPASSWDなdevelopユーザーを追加
3. 公式githubの環境構築スクリプトpico_setup.shを落として実行
4. /bin/bashでターミナルに入る

# Reference 

公式ドキュメント: chapter1. quick pico setupの部分をDocker化

https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf
