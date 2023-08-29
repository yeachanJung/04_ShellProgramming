#!/bin/bash

schedule_file="schedule.txt"

# 스케줄 파일 생성
if [ ! -e "$schedule_file" ]; then
    touch "$schedule_file"
fi

while true; do
    clear
    echo "스케줄 관리 프로그램"
    echo "1. 스케줄 추가"
    echo "2. 스케줄 조회"
    echo "3. 스케줄 삭제"
    echo "4. 종료"

    read -p "메뉴를 선택하세요 (1/2/3/4): " choice
    
    case $choice in
        1) 
            cal 2023
            read -p "스케쥴 입력할 날짜를 선택해주세요(ex: 2023-08-28): " choice_date
            read -p "새로운 스케줄을 입력하세요: " new_schedule
            current_date=$(date "+%Y-%m-%d")
            last_number=$(tail -n 1 "$schedule_file" | cut -d "." -f 1)
            new_number=$((last_number + 1))
            echo -e "$new_number. \e[33m$choice_date\e[0m $new_schedule" >> "$schedule_file"

            # 사용자 입력한 날짜에 스케줄 알림을 등록
            echo "bash notify_email.sh \"$new_schedule\"" | at "$choice_date" >> /dev/null 2>&1

            echo "새로운 스케줄이 추가되었습니다."
            ;;
        2)
            if [ -s "$schedule_file" ]; then
                echo "등록된 스케줄 목록:"
                cat "$schedule_file"
            else
                echo "등록된 스케줄이 없습니다."
            fi
            ;;
        3)
            if [ -s "$schedule_file" ]; then
                echo "등록된 스케줄 목록:"
                cat "$schedule_file"
                read -p "삭제할 스케줄의 번호를 입력하세요: " delete_number
                
                # 입력된 번호와 스케줄 목록의 번호 비교
                if grep -q "^$delete_number\." "$schedule_file"; then
                    sed -i "/^$delete_number\./d" "$schedule_file"
                    echo "선택한 스케줄이 삭제되었습니다."
                else
                    echo "입력한 번호에 해당하는 스케줄이 없습니다."
                fi
            else
                echo "등록된 스케줄이 없습니다."
            fi
            ;;
        4)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "잘못된 입력입니다. 1, 2, 3, 4 중에서 선택하세요."
            ;;
    esac
    
    read -p "계속하려면 아무 키나 누르세요..."
done
