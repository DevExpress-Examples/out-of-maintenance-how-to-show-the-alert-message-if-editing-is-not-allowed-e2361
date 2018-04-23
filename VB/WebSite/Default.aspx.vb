Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub grid_StartRowEditing(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs)
		Dim key As Object = e.EditingKeyValue
		Dim [date] As DateTime = Convert.ToDateTime(grid.GetRowValuesByKeyValue(key, "OrderDate"))
		Dim date2 As New DateTime(1994, 8, 8)

		If [date] > date2 Then
			e.Cancel = True
		End If
		grid.JSProperties("cpCancelEdit") = e.Cancel
		grid.JSProperties("cpMessage") = String.Format("OrderDate {0} is later than {1}", [date].ToShortDateString(), date2.ToShortDateString())
	End Sub
End Class
