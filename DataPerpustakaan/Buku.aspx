<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Buku.aspx.vb" Inherits="DataPerpustakaan.Buku" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="style.css"/>
    <style type="text/css">
        .auto-style27 {
            width: 95px;
            height: 26px;
        }
        .auto-style28 {
            width: 179px;
            height: 26px;
        }
        .auto-style29 {
            height: 26px;
        }
        .auto-style30 {
            width: 260px;
            height: 26px;
        }
        .auto-style31 {
            width: 260px;
            height: 12px;
        }
        .auto-style32 {
            width: 260px;
        }
        .auto-style33 {
            width: 260px;
            height: 24px;
        }
        .auto-style34 {
            height: 23px;
            width: 260px;
        }
    </style>
</head>
<body>
    <table class="logo">
        <tr>
            <td><img src="/Images/hogwarts-logo.png" alt="Hogwarts" /></td>
            <td><h1 class="auto-style3">DATA PERPUSTAKAAN </h1></td>
        </tr>
    </table>
    <menu>
        <ul>
            <li><a href="Buku.aspx">BUKU</a></li>
            <li><a href="Peminjaman.aspx">PEMINJAMAN</a></li>
            <li><a href="Anggota.aspx">ANGGOTA</a></li>
            <li><a href="Pengarang.aspx">PENGARANG</a></li>
            <li><a href="Penerbit.aspx">PENERBIT</a></li>
        </ul>
    </menu>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style4" colspan="2"><h2>DATA BUKU</h2></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style19"></td>
            <td class="auto-style20"></td>
            <td class="auto-style31"></td>
            <td class="auto-style22"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Judul</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox1" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style32">
                <asp:Button ID="Button5" runat="server" style="font-weight: 700" Text="Cari" Width="128px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style14">Genre</td>
            <td class="auto-style15">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="128px">
                    <asp:ListItem>Pilih Genre</asp:ListItem>
                    <asp:ListItem>Agama</asp:ListItem>
                    <asp:ListItem>Fantasi</asp:ListItem>
                    <asp:ListItem>Filsafat</asp:ListItem>
                    <asp:ListItem>Pendidikan</asp:ListItem>
                    <asp:ListItem>Psikologi</asp:ListItem>
                    <asp:ListItem>Sains</asp:ListItem>
                    <asp:ListItem>Sejarah</asp:ListItem>
                    <asp:ListItem>Self-Improvement</asp:ListItem>
                    <asp:ListItem>Teknologi</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style33"></td>
            <td class="auto-style17"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">ISBN</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox2" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style32">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27"></td>
            <td class="auto-style28">Pengarang</td>
            <td class="auto-style29">
                <asp:TextBox ID="TextBox3" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style30"></td>
            <td class="auto-style29"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Penerbit</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox4" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style32">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Status Peminjaman</td>
            <td class="auto-style7">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="96px" Height="32px">
                    <asp:ListItem Value="1">Dipinjam</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">Tersedia</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style32">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style8"></td>
            <td class="auto-style34">&nbsp;</td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                <asp:Button ID="Button1" runat="server" style="font-weight: 700" Text="Tambahkan" Width="256px" />
            </td>
            <td class="auto-style32">
                <asp:Button ID="Button3" runat="server" style="font-weight: 700" Text="Edit" Width="128px" />
                <asp:Button ID="Button4" runat="server" style="font-weight: 700" Text="Hapus" Width="128px" BackColor="#541F1B" ForeColor="White" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                <asp:Button ID="Button2" runat="server" style="font-weight: 700" Text="Tampilkan" Width="256px" />
            </td>
            <td class="auto-style32">
                <asp:Button ID="Button6" runat="server" style="font-weight: 700" Text="Buku Tersedia" Width="128px" />
                <asp:Button ID="Button7" runat="server" style="font-weight: 700" Text="Buku Dipinjam" Width="128px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style32">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">Jumlah Buku:
                <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
            </td>
            <td class="auto-style32">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7" colspan="3">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>

