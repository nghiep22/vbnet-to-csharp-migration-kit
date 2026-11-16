---
name: vb-port-data-interop
description: "Assess and port data-access, typed DataSet/TableAdapter, database contracts, COM/native dependencies and reporting components during a VB.NET-to-C# .NET 8 migration."
license: MIT
metadata:
  short-description: "Assess data, COM and reporting behavior"
---

# VB Data and Interop Migration

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Data/integration inventory, schema/procedure evidence, binary/version/architecture và sandbox data.

## Đầu ra

Compatibility matrix, data/interop mapping, contract tests và unresolved dependencies.

## Quy trình

1. Kiểm kê ADO.NET/provider, typed DataSet/xsd/TableAdapter, EF version, SQL/procedure, transactions, cache và connection/config references.
2. Theo dõi parameter type/size/direction, DBNull, decimal/date/culture, identity/concurrency và data-scope permissions. SQL động hoặc procedure thiếu source là unknown cần bằng chứng.
3. Kiểm tra generator cho typed resources/data/proxies; chuyển hoặc tái sinh đúng tool, giữ public types và serialization contract.
4. Với COM/native/ActiveX, ghi GUID/ProgID, typelib, registration, bitness, marshalling, apartment/threading và deploy dependencies.
5. Với reporting, kiểm kê templates, renderer version/license, parameters, pagination, font/image và output destinations; quyết định giữ/thay/tách có trong plan.
6. Đối chiếu data effects và integration trên sandbox. Không tự migrate ORM, sửa schema DB hoặc thay binary chưa được kiểm tra.

## Kiểm tra kết quả

- DB effects đúng theo baseline và transaction boundary.
- Interop được kiểm tra đúng kiến trúc CPU và môi trường, thiếu binary là not-run.
- Report layout/content được đối chiếu, không chỉ file PDF mở được.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
