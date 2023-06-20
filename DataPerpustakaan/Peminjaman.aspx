<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Peminjaman.aspx.vb" Inherits="DataPerpustakaan.Peminjaman" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="style.css" />
    <style type="text/css">
        .auto-style28 {
            width: 264px;
            height: 12px;
        }
        .auto-style29 {
            width: 264px;
        }
        .auto-style30 {
            width: 264px;
            height: 24px;
        }
        .auto-style31 {
            height: 23px;
            width: 264px;
        }
        .auto-style32 {
            width: 95px;
            height: 8px;
        }
        .auto-style33 {
            width: 179px;
            height: 8px;
        }
        .auto-style34 {
            height: 8px;
        }
        .auto-style35 {
            width: 264px;
            height: 8px;
        }
        .auto-style36 {
            color: #999999;
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
            <td class="auto-style4" colspan="2"><h2>DATA PEMINJAMAN</h2></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style19"></td>
            <td class="auto-style20"></td>
            <td class="auto-style28"></td>
            <td class="auto-style22"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">ISBN</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox1" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style29">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style14">NIM</td>
            <td class="auto-style15">
                <asp:TextBox ID="TextBox2" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style30"></td>
            <td class="auto-style17"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Tanggal Pinjam</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox3" runat="server" Width="128px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<span class="auto-style36">YYYY-MM-DD</span></td>
            <td class="auto-style29">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Tanggal Kembali</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox4" runat="server" Width="128px"></asp:TextBox>
                &nbsp;&nbsp; <span class="auto-style36">YYYY-MM-DD</span></td>
            <td class="auto-style29">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Status Pengembalian</td>
            <td class="auto-style7">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="96px">
                    <asp:ListItem Value="0" Selected="True">Belum</asp:ListItem>
                    <asp:ListItem Value="1">Sudah</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style29">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style8">
                &nbsp;</td>
            <td class="auto-style31">
                &nbsp;</td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style32"></td>
            <td class="auto-style33"></td>
            <td class="auto-style34">
                <asp:Button ID="Button1" runat="server" style="font-weight: 700" Text="Tambahkan" Width="256px" />
            </td>
            <td class="auto-style35">
                <asp:Button ID="Button6" runat="server" style="font-weight: 700" Text="Edit" Width="256px" />
            </td>
            <td class="auto-style34"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                <asp:Button ID="Button2" runat="server" style="font-weight: 700" Text="Tampilkan" Width="256px" />
            </td>
            <td class="auto-style29">
                <asp:Button ID="Button7" runat="server" BackColor="#541F1B" ForeColor="White" style="font-weight: 700" Text="Hapus" Width="256px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style29">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Masukkan ID Peminjaman</td>
            <td class="auto-style7">&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" style="font-weight: 700" Text="Cari" Width="72px" />
            </td>
            <td class="auto-style29">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style12"></td>
            <td class="auto-style2">
                </td>
            <td class="auto-style31"></td>
            <td class="auto-style2"></td>
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

