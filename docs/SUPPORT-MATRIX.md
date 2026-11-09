# Phạm vi hỗ trợ dự kiến

**Tất cả profile đang ở mức design-only.** Có hướng dẫn không đồng nghĩa đã chạy thành công một dự án.

| Nguồn | Đích | Thay đổi chính | Mức hiện tại |
| --- | --- | --- | --- |
| VB library/console | C# net8.0 hoặc net8.0-windows | Ngôn ngữ, project, dependency/API | Thiết kế |
| WinForms | C# WinForms net8.0-windows | Designer, resources, startup/events/binding | Thiết kế |
| MVC 5 / Web API 2 | ASP.NET Core MVC/API .NET 8 | Hosting, auth, routes, model binding | Thiết kế |
| Web Forms | Razor Pages/MVC hoặc Blazor đã chọn | Tái hiện page/control/postback flow | Thiết kế có quyết định UI |
| Windows Service / batch | Worker/Generic Host .NET 8 | Lifecycle, schedule, cancellation, account | Thiết kế |
| WCF/ASMX | .NET 8 service theo contract | Binding/security/serialization/consumer | Thiết kế có quyết định contract |
| Solution VB/C# hỗn hợp | Project C# theo dependency graph | TFM compatibility và consumer | Thiết kế |

Nguồn ưu tiên là .NET Framework 4.x và SDK-style VB .NET 6/7/8. Framework cũ hơn cần phục hồi toolchain trước. Nguồn mới hơn target 8 là downgrade, phải phân tích API. VB6/VBA nằm ngoài VB.NET.

Không hứa chuyển tự động ActiveX, private DLL, Crystal/RDLC hoặc SOAP feature chưa có môi trường thử. Ghi quyết định giữ/đổi/tách và mức kiểm chứng cho từng dependency. Không tự chuyển EF6 thành EF Core hoặc WinForms thành web.

Theo Microsoft, ASP.NET Core không chạy Web Forms trực tiếp; WCF server cần xem xét giải pháp như CoreWCF theo feature thực tế. Xem [nguồn chuẩn](SOURCES.md).
