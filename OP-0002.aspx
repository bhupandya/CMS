﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OP-0002.aspx.cs" Inherits="WebApplication1.OP_0002" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="/styles/OP_Form.css" />
    <style type="text/css">
        .auto-style14 {
            width: 171px;
        }
    </style>
</head>
<body>
    <h2 class="h2">
        <asp:Image ID="Image1" src="\images\sgvs.jpg" runat="server" Height="56px" /><br />
        <asp:Label ID="FormLbl" runat="server" Text="OP-0002"></asp:Label>: Control for water flushing</h2>

    <form id="form1" runat="server" style="border:1px solid #ccc">
    <div class="container">
    <div class="align">
    
    <table class="table_width" border="1">
                    <tr>
                        <td class="auto-style14"><b>Project No.:</b></td>
                        <td>
                            <asp:TextBox ID="ProjectNoTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Project Name:</b></td>
                        <td>
<%--                            <asp:TextBox ID="PlantTxtBox" runat="server" required="required" Width="100%"></asp:TextBox>--%>
                             <asp:DropDownList ID="ProjectNameDdl" runat="server" Width="100%" OnSelectedIndexChanged="ProjectNameDdl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="--Select Project--" Value=""></asp:ListItem>
                                </asp:DropDownList><br /></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Process Unit:</b></td>
                        <td>
                            <%--<asp:TextBox ID="PUTxtBox" runat="server" required="required" Width="100%"></asp:TextBox>--%>
                            <asp:DropDownList ID="PUNameDdl" Width="100%" runat="server" OnSelectedIndexChanged="PUNameDdl_SelectedIndexChanged" AutoPostBack="true" Enabled="false">
                                    <asp:ListItem Text="--Select Process Unit--" Value=""></asp:ListItem>
                                </asp:DropDownList><br />
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>System:</b></td>
                        <td>
<%--                            <asp:TextBox ID="SystemTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>--%>
                            <asp:DropDownList ID="SystemDdl" runat="server" Width="100%" AutoPostBack="true" Enabled="false">
                                   <asp:ListItem Text="--Select System--" Value=""></asp:ListItem>
                               </asp:DropDownList><br /></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Sub-System:</b></td>
                        <td>
                            <asp:TextBox ID="SubSystemTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Equipment:</b></td>
                        <td>
                            <asp:TextBox ID="EquipmentTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Tag Number:</b></td>
                        <td>
                            <asp:TextBox ID="TagNumberTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Discipline:</b></td>
                        <td>
                            <asp:TextBox ID="DisciplineTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Date:</b></td>
                        <td>
                            <asp:TextBox ID="DateTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>No. P&ID:</b></td>
                        <td>
                            <asp:TextBox ID="PIDTxtBox" runat="server" required="required" Width="100%"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Lines:</b></td>
                        <td>
                            <asp:TextBox ID="LinesTxtBox" runat="server" Width="100%"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Type of water used:</b></td>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                            <Items>
                            <asp:ListItem Text="Raw water" Value="Raw water"></asp:ListItem>
                            <asp:ListItem Text="Demi water" Value="Demi water"></asp:ListItem>
                            </Items>
                            </asp:CheckBoxList>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style14"><b>Type of inspection:</b></td>
                        <td>
                            <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                            <Items>
                            <asp:ListItem Text="Visual" Value="Visual"></asp:ListItem>
                            <asp:ListItem Text="Plate" Value="Plate"></asp:ListItem>
                            <asp:ListItem Text="QC lab results" Value="QC lab results"></asp:ListItem>
                            </Items>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
        </table>
    </div>
        <br/>

        <table class="table_width" border="1">
                    <tr><th class="th">No. P&ID</th>
                        <th class="th">Line No.</th>
                        <th class="th">From</th>
                        <th class="th">To</th>
                        <th class="th">Inspection results</th>
                        <th class="th">Sign/Date</th>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox1" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox2" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox3" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox4" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox5" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox6" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox7" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox8" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox9" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox10" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox11" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox12" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox13" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox14" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox15" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox16" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox17" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox18" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox19" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox20" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox21" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox22" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox23" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox24" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox25" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox26" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox27" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox28" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox29" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox30" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox31" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox32" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox33" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox34" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox35" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox36" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox37" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox38" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox39" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox40" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox41" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox42" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox43" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox44" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox45" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox46" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox47" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox48" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox49" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox50" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox51" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox52" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox53" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox54" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox55" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox56" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox57" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox58" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox59" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox60" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox61" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox62" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox63" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox64" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox65" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox66" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox67" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox68" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox69" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox70" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox71" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox72" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox73" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox74" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox75" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox76" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox77" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox78" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="TextBox79" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox80" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox81" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox82" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox83" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="TextBox84" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
            </table>
            <table class="table_width" border="1">
                <tr><td>Acceptance criteria: System must be free of millscale, debris, jointing compounds.</td></tr>
            </table>
    
        <div class="table_width"><label><b>Comments:</b></label>
        <asp:TextBox ID="CommentTxtBox" runat="server" TextMode="MultiLine" style="height:200px"></asp:TextBox>
        <table class="table_width" border="1">
                    <tr><th class="th">Responsible</th>
                        <th class="th">EPC</th>
                        <th class="th">Commissioning</th>
                        <th class="th">QA/QC</th>
                        <th class="th">Lead Start-up</th>
                    </tr>
                    <tr>
                        <td class="auto-style5"><label><b>Company:</b></label></td>
                        <td><asp:TextBox ID="IPCCompanyTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="CommissioningCompanyTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="QAQCCompanyTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="LeadStartUpCompanyTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style5"><label><b>Name:</b></label></td>
                        <td><asp:TextBox ID="IPCNameTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="CommissioningNameTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="QAQCNameTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="LeadStartUpNameTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style5"><label><b>Sign:</b></label></td>
                        <td><asp:TextBox ID="IPCSignTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="CommissioningSignTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="QAQCSignTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="LeadStartUpSignTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style5"><label><b>Date:</b></label></td>
                        <td><asp:TextBox ID="IPCDateTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="CommissioningDateTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="QAQCDateTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                        <td><asp:TextBox ID="LeadStartUpDateTxtBox" runat="server" Width="100%"></asp:TextBox></td>
                    </tr>
                </table>
        <div class="clearfix">
            Do you want to submit this form?
            <asp:RadioButtonList ID="SubmitRadioButtonList" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>True</asp:ListItem>
                <asp:ListItem>False</asp:ListItem>
            </asp:RadioButtonList><br />
                <asp:Button ID="printButton" runat="server" Text="Print this form" OnClientClick="javascript:window.print();" /><br />
        <asp:Button class="cancelbtn"  ID="SaveBtn" runat="server" Text="Exit" Width="50%" Float="left" CausesValidation="false" OnClick="SaveBtn_Click"/>
        <asp:Button class="submitbtn"  ID="SubmitBtn" runat="server" Text="Submit" Width="50%" Float="left" OnClick="SubmitBtn_Click"/>
        <asp:Label ID="SuccessLbl" runat="server"></asp:Label>
        </div>
        </div>
        </div>            
    </form>
</body>
</html>
