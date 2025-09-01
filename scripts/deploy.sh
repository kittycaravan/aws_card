#!/bin/bash

# 📋 로그 출력 함수
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# 📦 경로 설정
WAR_SRC=/home/ec2-user/app/card.war
TOMCAT_DIR=/opt/tomcat9
WAR_DEST=$TOMCAT_DIR/webapps/ROOT.war

log "배포 스크립트 시작"
log "기존 파일 정리는 stop.sh에서 처리됨 - ROOT.war, ROOT/, card.war"

# ❌ 파일이 존재하지 않으면 오류 처리
if [ ! -f "$WAR_SRC" ]; then
  log "❌ 오류: $WAR_SRC 파일이 존재하지 않습니다. 배포 중단."
  exit 1
fi

# 🚚 WAR 파일 이동
log "WAR 파일 이동: $WAR_SRC → $WAR_DEST"
#mv $WAR_SRC $WAR_DEST
sudo cp -f $WAR_SRC $WAR_DEST

# ✅ 배포 완료
log "WAR 파일 이동 완료. 톰캣이 자동 배포를 시작할 예정입니다."

exit 0

