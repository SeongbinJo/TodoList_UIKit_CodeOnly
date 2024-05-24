# TodoList_UIKit_CodeOnly
## 기본 요구사항
1. 할 일 목록 보기
2. 사용자는 현재 저장된 할 일 목록을 볼 수 있어야 합니다.
3. 목록은 테이블 뷰를 사용하여 표시됩니다.

##  할 일 추가
1. 사용자는 새로운 할 일을 추가할 수 있어야 합니다.
2. 새로운 할 일을 추가하는 UI는 모달 창이나 별도의 화면을 통해 제공됩니다.
3. 사용자가 제목을 입력할 수 있는 텍스트 필드가 필요합니다.
4. '추가' 버튼을 누르면 새로운 할 일이 목록에 추가됩니다.
## 할 일 삭제
1. 사용자는 기존의 할 일을 삭제할 수 있어야 합니다.
2. 스와이프하여 삭제하거나 편집 모드에서 삭제 버튼을 사용할 수 있습니다.
3. 할 일 완료 상태 변경
4. 사용자는 할 일을 완료 상태로 표시할 수 있어야 합니다.
5. 체크박스나 토글 버튼을 사용하여 할 일의 완료 상태를 변경할 수 있습니다.
## 추가 요구사항
1. 데이터 저장
2. 할 일 목록은 앱을 종료하고 다시 실행해도 유지되어야 합니다.
3. UserDefaults를 사용하여 데이터를 로컬에 저장합니다.
4. 기본 UI 디자인
5. 기본적인 UIKit 컴포넌트를 사용하여 직관적이고 간단한 UI를 제공합니다.
Auto Layout을 사용하여 다양한 화면 크기에 대응합니다.
예시 UI 흐름
메인 화면
Navigation Bar: "ToDo List" 타이틀, '추가' 버튼
Table View: 할 일 목록을 표시
할 일 추가 화면
Navigation Bar: "Add ToDo" 타이틀, '취소' 및 '저장' 버튼
Text Field: 할 일 제목 입력
할 일 목록
각 셀에는 할 일 제목과 완료 상태를 표시하는 체크박스(또는 토글 버튼)
스와이프하여 삭제 가능
기술 스택
UIKit
UITableView, UITableViewCell
UIButton, UITextField
UserDefaults
Auto Layout
Releases
No releases published
Create a new release
Packages
No packages published
Publish your first package