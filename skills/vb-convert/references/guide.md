# VB to C# Conversion: hướng dẫn

## Rủi ro trọng tâm

Option Compare Text theo culture không tương đương phép == C# mặc định. CInt làm tròn midpoint-to-even trong ca tương ứng; cast số nguyên C# cắt phần lẻ. IIf thường đánh giá cả hai nhánh còn If có short circuit. ByRef property/indexer có copy-in/copy-out khác lời gọi ref đơn giản.

Handles/WithEvents cần giữ đăng ký và thay đổi subscription khi object bị gán lại. My.Forms giữ ý nghĩa default instance khi cần. On Error/Resume phải bảo toàn đường tiếp tục sau lỗi, không bọc catch tùy ý. Kiểm tra Module, static local, default/optional, ReDim Preserve, For Step/bounds và MyClass dispatch.

## Công cụ

CodeConverter là ứng viên Roslyn, không phải dependency đã chứng nhận của skill. Đọc README/changelog và thử đúng mode/version. Hỗ trợ CLI Framework có thể khác VS extension. Runtime chạy converter độc lập với target application.

## Chất lượng

C# idiom cleanup được thực hiện sau parity trong task riêng. Giữ API Microsoft.VisualBasic khi hợp lệ có thể giúp bảo toàn hành vi, không coi sự tồn tại của reference đó là conversion thất bại.
