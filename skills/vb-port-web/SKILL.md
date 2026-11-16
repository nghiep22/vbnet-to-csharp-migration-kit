---
name: vb-port-web
description: "Migrate VB.NET ASP.NET MVC 5, Web API 2 or Web Forms workloads to a selected ASP.NET Core .NET 8 architecture, preserving routes, authentication, session, behavior and external contracts."
license: MIT
metadata:
  short-description: "Plan and port legacy VB web workloads"
---

# VB Web Application Migration

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Web subtype, pages/controllers, hosting/config/auth/session inventory, baseline và target UI decision.

## Đầu ra

Route/page/control/service mapping, C# implementation tasks và HTTP/UI/auth/data parity evidence.

## Quy trình

1. Phân biệt MVC5, WebAPI2, WebForms, WebSite không project và kiểu hỗn hợp; kiểm kê Global.asax, modules/handlers, web.config, markup/code-behind và user controls.
2. Map routes, filters, binding/validation, serialization, upload/download, caching, authentication/roles, session/cookies và external consumers.
3. Với WebForms, tạo decision cho Razor Pages/MVC/Blazor theo yêu cầu. Map ViewState, postback, lifecycle/control state và validation tới workflow mới; không chỉ đổi đuôi file.
4. Chọn chuyển từng capability/route khi phù hợp. Compatibility adapters/proxy là giải pháp cần thử đúng .NET 8 và contract, không tự đảm bảo toàn bộ System.Web.
5. Chuyển logic theo ngữ nghĩa VB và port hosting/middleware/config với tiêu chí cụ thể. Không tự đổi schema hoặc hệ thống identity ngoài scope.
6. Chạy HTTP contract và Playwright workflow test so baseline; kiểm tra quyền dữ liệu, session isolation, redirects, errors, concurrency và DB effects.

## Kiểm tra kết quả

- WebForms UI mới có quyết định và mapping, không dùng page stub để nghiệm thu.
- Auth/session/route/serialization và quyền dữ liệu được đối chiếu.
- Phần coexistence/proxy chưa loại bỏ được ghi là migration một phần.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
