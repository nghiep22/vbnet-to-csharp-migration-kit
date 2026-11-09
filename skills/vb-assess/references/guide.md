# VB Source Assessment: hướng dẫn

## Bằng chứng và coverage

Một finding lưu rule ID, severity, claim type, file/line hoặc symbol, confidence, impact và proposed action. Đọc một query trong source chưa chứng minh toàn bộ nghiệp vụ của stored procedure. SQL động, plugin qua reflection và tích hợp private có thể cần runtime trace hoặc tài liệu bổ sung.

## Không bỏ qua generated code quan trọng

Designer, typed DataSet và service proxy có thể định nghĩa event/data/contract quan trọng. Đánh dấu generator và chọn cách tái sinh; không áp bộ lọc bỏ mọi generated file.

## Ranh giới helper

Nếu có Get-StaticInventory.ps1 từ kit, đó là helper đọc project/XML sơ bộ. Nó không resolve compilation, không phân tích call graph và không chứng minh package tương thích. Khi skill cài độc lập và helper không có, dùng công cụ đọc source sẵn có thay vì gọi đường dẫn giả.

## Phân loại

WinForms: Forms/designer và references; web: System.Web, markup, MVC/API signals; service: ServiceBase, svc/asmx/contracts; library: assembly/consumer. Một project có thể có nhiều dấu hiệu và cần review.
