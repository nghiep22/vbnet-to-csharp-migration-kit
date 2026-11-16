# VB to C# Conversion: hướng dẫn

## Rủi ro trọng tâm

Option Compare Text theo culture không tương đương phép == C# mặc định. CInt làm tròn midpoint-to-even trong ca tương ứng; cast số nguyên C# cắt phần lẻ. IIf thường đánh giá cả hai nhánh còn If có short circuit. ByRef property/indexer có copy-in/copy-out khác lời gọi ref đơn giản.

Handles/WithEvents cần giữ đăng ký và thay đổi subscription khi object bị gán lại. My.Forms giữ ý nghĩa default instance khi cần. On Error/Resume phải bảo toàn đường tiếp tục sau lỗi, không bọc catch tùy ý. Kiểm tra Module, static local, default/optional, ReDim Preserve, For Step/bounds và MyClass dispatch.

## Công cụ

CodeConverter là ứng viên Roslyn, không phải dependency đã chứng nhận của skill. Đọc README/changelog và thử đúng mode/version. Hỗ trợ CLI Framework có thể khác VS extension. Runtime chạy converter độc lập với target application.

## Chất lượng

C# idiom cleanup được thực hiện sau parity trong task riêng. Giữ API Microsoft.VisualBasic khi hợp lệ có thể giúp bảo toàn hành vi, không coi sự tồn tại của reference đó là conversion thất bại.

## Preflight và phạm vi apply

Ghi converter mode/version, runtime chạy tool, project/solution context, config/platform và reference resolution. Thử trên project hoặc nhóm nhỏ có các construct rủi ro trước khi chạy rộng; lưu output, diagnostics và diff để xem tool có giữ namespace/resource/contract. Nếu converter không load được Framework project ở mode đã chọn, chuyển sang mode khác chỉ sau POC, không dùng cú pháp đoán.

Chọn ranh giới compilation đủ rộng cho partial class, generated code và project references. Sinh output riêng hoặc preview, đối chiếu số file gốc với map gồm converted, retained, pending, excluded và lý do. Chỉ apply phần nằm trong task đã chọn; giữ provenance của Designer, resx, settings, xsd và proxy để có thể regenerate đúng nguồn.

## Rà ngữ nghĩa theo dấu hiệu source

| Dấu hiệu VB | Sai lệch C# dễ gặp | Case cần đối chiếu |
| --- | --- | --- |
| Option Compare Text, Like | == hoặc regex không cùng culture/pattern | Hoa thường, dấu, null và pattern biên |
| CInt/CLng/CDate, Option Strict Off | cast/parse khác làm tròn, overflow, culture | Midpoint, giá trị biên, input lỗi |
| IIf, And, Or | short circuit ngoài ý muốn | Số lần đánh giá và side effect |
| ByRef property/indexer | ref trực tiếp không giữ copy-in/out | Giá trị trước/sau và thứ tự getter/setter |
| Handles/WithEvents, My.Forms | subscription/default instance đổi | Gán lại nguồn event, mở/đóng form |
| On Error/Resume | catch bao ngoài đổi điểm tiếp tục | Exception và side effect sau lỗi |
| ReDim Preserve, For Step | bounds/step khác | Mảng rỗng, step âm, biên loop |

Bảng là nơi ưu tiên kiểm tra, không là công thức thay thế tự động. Đọc biểu thức gốc và kiểm tra overload/type/culture trước khi chọn cách dịch. Có thể giữ API Microsoft.VisualBasic khi được build và case chứng minh phù hợp; không dọn helper chỉ vì mã C# trông chưa idiomatic.

## Triage diagnostics và hoàn tất task

Gom lỗi compiler theo nguyên nhân: reference thiếu, name/RootNamespace, generated file, API không tương thích hoặc sai conversion. Sửa nguyên nhân gốc và chạy lại ca liên quan; không xóa nhánh hoặc thêm return mặc định để qua build. Sau apply, kiểm tra project build ở mốc được plan chọn, API/resource lookup và semantic cases của task. Lưu command, exit code, diff/map, unresolved và case not-run; các phần ấy quyết định trạng thái task.
