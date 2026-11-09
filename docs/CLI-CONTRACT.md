# CLI tương lai — chưa triển khai

Tên vbm ở đây là thiết kế; repo hiện không cung cấp executable/package tương ứng.

~~~text
vbm doctor <solution>
vbm assess <solution> --target net8.0 --analysis-mode static|semantic --out <dir>
vbm baseline --run <id>
vbm plan --run <id>
vbm convert --plan <file> --dry-run
vbm apply --plan <file> --task <id>
vbm verify --run <id>
vbm report --run <id>
vbm resume --run <id>
~~~

Command cần JSON output và exit code cho success, prerequisite missing, decision required, verification failed. Static mode không tự restore/build. Semantic mode phải ghi reference/load/config coverage. Apply xuất diff và state; rollback chỉ đảo thay đổi thuộc task, không reset toàn repo.

Component dự kiến: Core, Analysis, Conversion, Verification, Reporting và CLI, với adapter MSBuild/CodeConverter/host. Chỉ tạo source module khi bắt đầu triển khai; không tạo folder giả hoặc success stub ở release lý thuyết.
