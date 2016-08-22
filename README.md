# 부킹시스템 

부킹시스템은 cfwheels 기반으로 만들어진 웹기반 부킹 시스템입니다.

## 목차 

- [설치](#설치)
- [인증](#인증)
- [권한](#권한)
- [세팅](#세팅)
- [erd](#erd)


## 설치

 - [Railo 4.2.x][1]
 - [Lucee 4.5.x][2]
 - [ColdFusion 10 or higher ] [3]
 - [Mysql 5.x][4]

    1. 어플리케이션 웹루트에 압축을 푼다.
    2. /config/settings.cfm 파일수정
    3. /install/booking.sql  실행
    

## 인증

### 기본롤 
4개의 디폴트 롤이 있습니다, 어드민, 편집자, 사용자, 게스트.

각각의 롤은 시스템이 작동하는 방식에 따라 다량양 권한 레벨을 가지고 있습니다. 예로 등록된 사용자에 대한 보기권한, 편집자에게는 생성권한, 부킹을 생성했을때는 모든 사용자에게는 승인과정를 부여해 줄 수 있습니다. 기본적인 역할은 이미 세팅되어 있습니다.

### 어드민 역할

하나의 계정만 존재합니다. 다른 사용자의 계정을 생성 관리 삭제 할 수 있습니다. 따라서 관리에 보안이 요구됩니다.

### 편집자 및 일반 사용자

대분분의 사용자권한은  편집자와 일반 사용자입니다. 편집자는 부킹을 승인을 해 줘야 하므로 내부 사람이나 스텝이 사용할 수 있는 권한입니다. 

### 게스트 
어나니머스 사용자를 지칭합니다. 그래서 기본적으로는 단지 일반사용자에게만 애플리케이션 접근이 허용됩니다. 게스트에 오픈된 권한이 무엇인지 파악하여 엄격하게 관리해야 합니다. 

### 추가적인 역할 생성
필요하다면 역할명을 추가햐여 새로운 권한을 부여해서 만들 수 있습니다.
단지 권리자만 이권한을 가질 수 있습니다.

## 권한

권한은 permissions 테이블 내에 간단한 행렬 형태로 정의되어 있습ㄴ디ㅏ. 역할에 대한 권한을 편집하기 위해서는 세팅매뉴에서 권한 섹션으로 들어가서 편집 버튼을 클릭하여 바꿀 수 있습니다.

기호:
[a] = 관리자만 접근하도록 추천
[a/e] = 관리자 및 편집자만 접근하도록 추천

권한   | 설명
------------ | -------------
accessApplication | 부킹에 접급허용  - 등록된 사용자만 접근하도록 원한다면 , 게스트 역할에서 이 권한을 빼야 합니다.
accessCalendar | 메인 카렌다 뷰에 대한 접근허용
accessCustomFields [a] | 사용자정의 필드와 템플릿에 대한 설정 허용 - 위 권한을 가진 역할은 input/output 템플릿을 생성, 수정 삭제할 수 있습니다.
accessLocations [a/e] | 로케이션에 대한 접근 허용 
accessLogfiles [a] | 로그파일 접근허용 
accessPermissions [a] | 권한에대한 접근허용
accessResources [a/e] | 리소스에대한 접근 허용
accessSettings [a] | 세팅에 대한 접근 허용 
accessUsers [a] | 사용자 계정에 대한 접근 허용
allowAPI | 예약
allowApproveBooking [a/e] | 부팅 승인에 다한 접근 허용
allowiCal | 예약
allowRoomBooking | 부팅 허용
allowRSS | 예약
bypassApproveBooking [a] | 자동 부킹 승인 허용 . 관리자나 편집자 역할에 한해서만 가능.
updateOwnAccount | 사용자의 상세 정보를 수정 
viewRoomBooking | 부킹 상세정보 보기 


## 세팅

### 어플리케이션 세팅

#### 어플리케이션 환경설정

시스템 기능들이 밑에 의한 세팅값으로 쉽게 변경 할 수 있습니다. 변경한 후에  시스템을 재 시작하여 주십시요.(**)

### 카렌다 세팅

이름  | 설명 | 기본값
------------ | ------------- | -------------
calendarAllDaySlot | 카렌다 상위에 "all-day" 스롯에 표시될지 여부   | true
calendarAllDayText | 카렌다 상위에 "all-day" 스롯에 표시될 텍스트 | all-day
calendarAxisFormat | 아젠다 뷰의 y 축에 표시될 시간 텍스트 포맷 | h(:mm)a
calendarColumnFormatDay | 일 표시 포맷 | dddd d/M
calendarColumnFormatMonth | 월 표시 포맷 | ddd
calendarColumnFormatWeek | 주 표시 포맷| ddd d/M
calendarDefaultView | 카렌다 기본 뷰  - 월, 주, 일  | month
calendarFirstday | 일주에서 시작하는 요일: 1 = Monday, 0 = Sunday | 1
calendarHeadercenter | 카렌다 헤더 표시  센터 | title 
calendarHeaderleft | 카렌다 헤더 표시 왼쪽 | prev,next today
calendarHeaderright | 카렌다 헤더 표시 오른쪽 | month,agendaWeek,agendaDay
calendarHiddenDays | 특정한 날 숨기기  | [] 
calendarMaxtime | 표시되는 카렌다 최대 시간 (포맷 HH:mm:SS) | 23:00:00
calendarMintime | 표시되는 카렌다 최소 기산 (포맷 HH:mm:SS) | 07:00:00
calendarSlotEventOverlap | 아젠다 뷰에 이벤트가 오버랩되어 표시 될지 여부 | 0
calendarSlotMinutes | 스롯마다 분 (포맷 HH:mm:SS) | 00:15:00
calendarTimeformat | 카렌다 시간 포맷 | H:mm
calendarWeekends | 주표시 할지 여부 | 1
calendarWeekNumbers | 카렌다에 주 번호가 표시될지 여부 | 0

### 이메일  세팅

이름   | 설명 | 기본값
------------ | ------------- | -------------
bccAllEmail | 참조 이메일 여부 |false
bccAllEmailTo| 참조 이메일 |  admin@domain.com
siteEmailAddress| 이메일 주소 | webmaster@email.com

### 일반 세팅 


이름  | 설명 | 기본값
------------ | ------------- | -------------
allowResources| 리소스 허용 여부|1
allowSettings| 세팅 허용 여부 |1
approveBooking|allowApproveBooking 권한을 가진 사용자에의해 새로운 부킹을 승인할지 여부 |1
defaultDateFormat| 기본적인 데이타 포맷 |YYYY MMM DD
defaultTimeFormat| 기본시간포맷|HH:MM
googleanalytics| 구글 애너리틱 코드 (format: UA-XXXXX-X) | UA-*****
isDemoMode| 데모 모드 |0
resourceTypes|가능한 소스 타입 리스트(, 구분자로 구성된 목록)|Computers,Audio Visual,Furniture
sitedescription| 사이트  설명 | 부킹 시스템
sitelogo|사이트 로고 , 20px x 20px 추천 |/
sitetitle|사이트 타일틀 | 부킹 시스템
version|버젼넘버: DB 버젼넘버 |1.0

### 위치 설정

이름   | 설명 | 기본값
------------ | ------------- | -------------
allowLocations| 0으로 세팅하면 웹인터페이스를 통해 모든 위치르 편집하려는 기능이 불가능합니다. |1
roomlayouttypes| 룸 레이아웃 타입 ( , 구별자로 여러개 입력하능) | Standard,Boardroom,Lecture
showlocationcolours| 위치 칼라와 함께 카렌다 목록을 표시할지 여부 | 1
showlocationfilter| 메인카렌다 페이지에 위치필터바를 표시할지 여부 | 1

## ERD

    (작성툴 :MySql WorkBench6.3) 
    [erd](/documents/booking.pdf), [소스] (/documents/booking.mwb)
    
[1]: https://bitnami.com/stack/railo/installer
[2]: http://lucee.org/
[3]: https://cfwheels.org/
[4]: https://www.mysql.com/
[7]: http://momentjs.com/
