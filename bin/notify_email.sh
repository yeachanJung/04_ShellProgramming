#!/bin/bash

recipient="root@main.example.com"  # 수신자 이메일 주소
subject="스케줄 알림"  # 이메일 제목
notification_text="$1"  # 알림 내용

echo -e "Subject:$subject\n$notification_text" | /usr/sbin/sendmail "$recipient"