# Rủi ro ngữ nghĩa VB → C#

| Nhóm | Cần khảo sát | Cần đối chiếu |
| --- | --- | --- |
| Option Strict/Infer/Explicit | Project/file options, object arithmetic, implicit conversion | Overload, default property, late binding/CallByName |
| Option Compare / Like | Binary/Text và culture | Casing, ký tự có dấu, null/empty, pattern |
| CInt/CLng/CDate/CStr | Làm tròn, overflow và culture | Midpoint, biên, invalid input, ngày/decimal |
| Nothing/nullable/DBNull | Default value vs null vs DB null | Result, exception, serialization |
| ByRef | Property/indexer copy-in/out và aliasing | Giá trị và evaluation order |
| Handles/WithEvents | Subscription, thay object, constructor order | Event count/order, unsubscribe và disposal |
| My.* | Forms default instance, settings, resources, app framework/user | Startup/shutdown, persistence và identity |
| On Error/Resume/Err | Phạm vi và điểm tiếp tục | Failure path và side effect; không thay bằng catch tùy ý |
| IIf/If và And/AndAlso/Or/OrElse | Eager vs short circuit | Nhánh nào chạy và số lần side effect |
| For/Step/ReDim Preserve/static local | Bounds, step âm, state/mảng | Input biên và vòng lặp nhiều lần |
| RootNamespace/Imports/casing | Tên type thực tế, lookup resource/reflection | Public consumer và config lookup |
| Module/default/optional/XML/MyClass | Dispatch, call shape, XML/serialization | Kết quả và contract |

Ví dụ: CInt(1.5) cho 2, còn cast C# (int)1.5 cho 1. Option Compare Text có thể làm phép so sánh a/A bằng nhau. Không suy từ ví dụ rằng mọi phép so sánh cần cùng một comparer: phải theo type/culture và operator gốc.

Được giữ API tương thích Microsoft.VisualBasic trong C# nếu đó là cách đã kiểm chứng để bảo toàn hành vi. Dọn helper, bật nullable toàn bộ, đổi async hay tái cấu trúc là task riêng sau parity.

Nguồn chuẩn: [Option Compare](https://learn.microsoft.com/en-us/dotnet/visual-basic/language-reference/statements/option-compare-statement), [VB conversion functions](https://learn.microsoft.com/en-us/dotnet/visual-basic/language-reference/functions/type-conversion-functions). Bổ sung fixture trước khi công bố một nhóm đã hỗ trợ.
