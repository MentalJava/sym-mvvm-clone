# sym_mvvm_clone



## Special Thanks

본 피그마는 SYM(Speack Your Mind) Design System을 학습용으로 Clone 한 디자인입니다.
학습 용도로만 사용하며, 출처를 밝히고 flutter code 및 README.md를 github public으로 올리겠습니다.
공유에 감사드립니다.

Original Github Repository Link : https://github.com/Good-MoGong/SYM?tab=readme-ov-file

**PM**  
[박혜연](https://github.com/hye-y)  
**디자이너**  
[한지수](https://m.blog.naver.com/hhhjs-?tab=1)  
**Developers**  
[박서연](https://github.com/syss220211)
[조민근](https://github.com/LutherCho)
[안지영](https://github.com/yyomzzi)
[전민석](https://github.com/a-jb97)
[변상필](https://github.com/OzDevelop)



### 초기 구조 설계
<details>
<summary>접기/펼치기</summary><br>

 mvvm + repository pattern 로 진행 하였습니다.  
 그 이유는 최근 들었던 강의에서 위와 같은 pattern 을 배웠고, clean architecture 를 적용하려고 하였으나 아직 공부 중이기에 해당 pattern 을 사용하여 프로젝트에 적용해보고자 설계를 하였습니다.

 **앞으로 프로젝트 진행하면서 더 디테일하게 바뀔 예정입니다.**

**data**

- model
- repository
    - sign_in
        - sign_in_repository.dart
        - sign_in_repository_impl.dart
    - sign_up
        - sign_up_repository.dart
        - sign_up_repository_impl.dart
    - home
        - home_repository.dart
        - home_repository_impl.dart

**ui**

- component
    - typography.dart
    - color.dart
    - button.dart
    - text_field.dart
    - navigation.dart
- sign_in
    - sign_in_view.dart
    - sign_in_view_model.dart
    - sign_in_widget
        - kakao_login_button.dart
        - google_login_button.dart
- sign_up
    - sign_up_view.dart
    - sign_up_view_model.dart
    - sign_up_widget
        - nickname_textfield.dart
        - tscs_dialog.dart
- home
    - home_view.dart
    - home_view_model.dart
    - home_widget
        - calendar.dart
        - emotion_records.dart
        - bottom_navigation.dart
- my_page
    - my_page_view.dart
    - my_page_view_model.dart
    - my_page_widget
        - send_feedback.dart
        - customer_support.dart
        - bottom_navigation.dart
- nickname_edit
    - nickname_edit_view.dart
    - nickname_edit_view_model.dart
    - nickname_edit_widget
        - widget list ...
- setting
    - setting_view.dart
    - setting_view_model.dart
    - setting_widget
        - widget list ...
- loading
    - loading_view.dart
    - loading_view_model.dart
- emotion_diary
    - emotion_diary_view_model.dart
    - view
        - emotion_today
            - emotion_today_view.dart
            - emotion_widget
                - widget list ...
        - emotion_think
            - emotion_think_view.dart
            - emotion_think_widget
                - widget list ...
        - emotion_choice
            - emotion_choice_view.dart
            - emotion_choice_widget
                - widget list ...
        - emotion_action
            - emotion_action_view.dart
            - emotion_action_widget
                - widget list ...
- emotion_diary_done
    - emotion_diary_done_view.dart
    - emotion_diary_done_view_model.dart
    - emotion_diary_widget
        - widget list ...
- emotion_diary_read
    - emotion_diary_read_view.dart
    - emotion_diary_read_view_model.dart
    - emotion_diary_read_widget
        - my_read_emotion.dart
        - my_read_records.dart
- emotion_diary_edit
    - emotion_diary_edit_view.dart
    - emotion_diary_edit_view_model.dart
    - emotion_diary_edit_widget
        - my_edit_emotion.dart
        - my_edit_records.dart
        - edit_cancel_dialog.dart


</details>