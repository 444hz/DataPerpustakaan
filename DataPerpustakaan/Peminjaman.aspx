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
        .auto-style38 {
            height: 23px;
            width: 128px;
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
            <td class="auto-style4" colspan="3"><h2>DATA PEMINJAMAN</h2></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style19"></td>
            <td class="auto-style20"></td>
            <td class="auto-style28" colspan="2"></td>
            <td class="auto-style22"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">ISBN</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox1" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style29" colspan="2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25"></td>
            <td class="auto-style14">NIM</td>
            <td class="auto-style15">
                <asp:TextBox ID="TextBox2" runat="server" Width="256px"></asp:TextBox>
            </td>
            <td class="auto-style30" colspan="2"></td>
            <td class="auto-style17"></td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Tanggal Pinjam</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox3" runat="server" Width="128px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<span class="auto-style36">YYYY-MM-DD</span></td>
            <td class="auto-style29" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Tanggal Kembali</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox4" runat="server" Width="128px"></asp:TextBox>
                &nbsp;&nbsp; <span class="auto-style36">YYYY-MM-DD</span></td>
            <td class="auto-style29" colspan="2">&nbsp;</td>
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
            <td class="auto-style29" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style29" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style8">
                &nbsp;</td>
            <td class="auto-style31" colspan="2">
                &nbsp;</td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style32"></td>
            <td class="auto-style33"></td>
            <td class="auto-style34">
                <asp:Button ID="Button1" runat="server" style="font-weight: 700" Text="Tambahkan" Width="256px" />
            </td>
            <td class="auto-style35" colspan="2">
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
            <td class="auto-style29" colspan="2">
                <asp:Button ID="Button7" runat="server" BackColor="#541F1B" ForeColor="White" style="font-weight: 700" Text="Hapus" Width="256px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style29" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">Masukkan ID Peminjaman</td>
            <td class="auto-style7">&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" style="font-weight: 700" Text="Cari" Width="64px" />
            </td>
            <td class="auto-style29" colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26"></td>
            <td class="auto-style12">Jumlah Peminjaman:
                <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" style="text-align: left" Width="128px">
                    <asp:ListItem Selected="True">Pilih Tahun</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                    <asp:ListItem>2022</asp:ListItem>
                    <asp:ListItem>2023</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList2" runat="server" Height="22px" style="text-align: left" Width="128px">
                    <asp:ListItem>Pilih Bulan</asp:ListItem>
                    <asp:ListItem>Januari</asp:ListItem>
                    <asp:ListItem>Februari</asp:ListItem>
                    <asp:ListItem>Maret</asp:ListItem>
                    <asp:ListItem>April</asp:ListItem>
                    <asp:ListItem>Mei</asp:ListItem>
                    <asp:ListItem>Juni</asp:ListItem>
                    <asp:ListItem>Juli</asp:ListItem>
                    <asp:ListItem>Agustus</asp:ListItem>
                    <asp:ListItem>September</asp:ListItem>
                    <asp:ListItem>Oktober</asp:ListItem>
                    <asp:ListItem>November</asp:ListItem>
                    <asp:ListItem>Desember</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td class="auto-style38">
                <asp:DropDownList ID="DropDownList3" runat="server" Height="22px" style="text-align: left" Width="128px">
                    <asp:ListItem Selected="True">Pilih Tanggal</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style38">
                <asp:Button ID="Button8" runat="server" style="font-weight: 700" Text="Cari" Width="64px" />
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style7" colspan="4">
    
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

