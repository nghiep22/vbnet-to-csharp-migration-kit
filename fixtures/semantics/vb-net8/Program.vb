Option Strict On
Option Compare Text

Imports System
Imports System.Globalization

Module ReferenceProbe
    Sub Main()
        CultureInfo.CurrentCulture = CultureInfo.InvariantCulture
        Console.WriteLine("round=" & CInt(1.5).ToString(CultureInfo.InvariantCulture))
        Console.WriteLine("compare=" & ("a" = "A").ToString())
        Dim values(1) As Integer
        Console.WriteLine("arrayLength=" & values.Length.ToString(CultureInfo.InvariantCulture))
        Dim absent As String = Nothing
        Console.WriteLine("fallback=" & If(absent, "fallback"))
    End Sub
End Module
