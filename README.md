# j_planner

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# drift 커맨드
```bash
flutter pub run build_runner build 
```
# Web build 방법
```bash
flutter build web --base-href /jplanner_flutter/build/web/
```
flutter 로 web 을 빌드하면 build/web/ 경로에 브라우저에서 사용할 파일들이 생성된다.
이걸 현재 git repo 인 https://github.com/asd9001/jplanner_flutter.git 에 push 하면 자동으로 
http://asd9001.github.io/jplanner_flutter/build/web 경로로 파일이 배포되어 접속 시 갱신된 화면을 볼 수 있다.

URL 경로에서 뒤에 디렉터리 구조를 빼고 싶으면 asd9001.github.io repo 에 직접 build/web 의 결과물들을
업로드하면 가능은 한데, "빌드 -> 다른 repo 에 결과 복사 -> git commit -> git push" 작업이 귀찮다.
