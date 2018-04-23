<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>How to show the alert message if editing is not allowed</title>
    <script type="text/javascript">
        var command;
        function OnBeginCallback(s, e) {
           command = e.command;
        }
        function OnEndCallback(s, e) {
            if (command == "STARTEDIT") {
                if (s.cpCancelEdit)
                    alert("The record can't be edit, reason: " + s.cpMessage);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
			DataSourceID="dsOrders" KeyFieldName="OrderID" 
			onstartrowediting="grid_StartRowEditing">
			<Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True"/>
				<dx:GridViewDataTextColumn FieldName="OrderID" ReadOnly="True" VisibleIndex="1">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="2">
				</dx:GridViewDataDateColumn>
				<dx:GridViewDataTextColumn FieldName="ShipName" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ShipCity" VisibleIndex="4">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ShipCountry" VisibleIndex="5">
				</dx:GridViewDataTextColumn>
			</Columns>
			<ClientSideEvents BeginCallback="OnBeginCallback" EndCallback="OnEndCallback" />
		</dx:ASPxGridView>

        <asp:AccessDataSource ID="dsOrders" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [OrderID], [OrderDate], [ShipName], [ShipCity], [ShipCountry] FROM [Orders]">
        </asp:AccessDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
