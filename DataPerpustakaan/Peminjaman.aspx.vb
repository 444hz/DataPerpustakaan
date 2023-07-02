Imports MySql
Imports MySql.Data
Imports MySql.Data.MySqlClient
Public Class Peminjaman
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Then
            MsgBox("ISBN buku tidak boleh kosong!", MsgBoxStyle.Information)
            TextBox1.Focus()
        Else
            If TextBox2.Text = "" Then
                MsgBox("NIM anggota harus diisi!", MsgBoxStyle.Information)
                TextBox2.Focus()
            Else
                If TextBox3.Text = "" Then
                    MsgBox("Tanggal pinjam harus diisi!", MsgBoxStyle.Information)
                    TextBox3.Focus()
                Else
                    If TextBox4.Text = "" Then
                        MsgBox("Tanggal kembali tidak boleh kosong!", MsgBoxStyle.Information)
                        TextBox4.Focus()
                    Else
                        Dim koneksi1 As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                        koneksi1.Open()
                        Dim cari As String = "SELECT * FROM buku WHERE ISBN = '" & TextBox1.Text & "'"
                        Dim command1 As New MySqlCommand(cari, koneksi1)
                        Dim reader1 As MySqlDataReader = command1.ExecuteReader
                        If Not reader1.Read Then
                            MsgBox("Buku dengan ISBN " & TextBox2.Text & " belum tersimpan. Tambahkan buku baru!", MsgBoxStyle.Information)
                            TextBox2.Focus()
                        Else
                            Dim koneksi2 As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                            koneksi2.Open()
                            Dim cari1 As String = "SELECT * FROM mahasiswa WHERE NIM = '" & TextBox2.Text & "'"
                            Dim command2 As New MySqlCommand(cari1, koneksi2)
                            Dim reader2 As MySqlDataReader = command2.ExecuteReader
                            If Not reader2.Read Then
                                MsgBox("Anggota dengan NIM " & TextBox2.Text & " belum tersimpan. Tambahkan anggota baru!", MsgBoxStyle.Information)
                                TextBox2.Focus()
                                koneksi2.Close()
                            Else
                                Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                                koneksi.Open()
                                Dim input As String = "INSERT INTO peminjaman(ISBN, NIM, tanggal_pinjam, tanggal_kembali, status_kembali) VALUES('" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "','" & RadioButtonList1.SelectedValue & "')"
                                Dim pinjam As String = "UPDATE buku SET status_pinjam = 1 WHERE ISBN = '" & TextBox1.Text & "'"
                                Dim command As New MySqlCommand(input, koneksi)
                                Dim command3 As New MySqlCommand(pinjam, koneksi)
                                command3.ExecuteNonQuery()
                                Dim reader As MySqlDataReader = command.ExecuteReader
                                MsgBox("Data peminjaman buku berhasil disimpan.", MsgBoxStyle.Information)
                                RadioButtonList1.SelectedIndex = 0
                                TextBox1.Text = ""
                                TextBox2.Text = ""
                                TextBox3.Text = ""
                                TextBox4.Text = ""
                                koneksi.Close()
                            End If
                        End If
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim tampil As String = "SELECT id_pinjam, peminjaman.ISBN, buku.judul AS judul_buku, peminjaman.NIM, mahasiswa.nama AS nama_mahasiswa, tanggal_pinjam, tanggal_kembali, status_kembali FROM peminjaman JOIN buku ON peminjaman.ISBN = buku.ISBN JOIN mahasiswa ON peminjaman.NIM = mahasiswa.NIM"
        Dim count As New MySqlCommand("SELECT COUNT(*) FROM peminjaman", koneksi)
        Dim adapter As New MySqlDataAdapter(tampil, koneksi)
        Dim ds As New DataSet
        adapter.Fill(ds)
        Dim tabel As DataTable = ds.Tables(0)
        Label1.Text = count.ExecuteScalar().ToString()
        GridView1.DataSource = tabel
        GridView1.DataBind()
        adapter.Dispose()
        koneksi.Close()
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim cari As String = "SELECT * FROM peminjaman WHERE id_pinjam = '" & TextBox5.Text & "'"
        Dim command As New MySqlCommand(cari, koneksi)
        Dim reader As MySqlDataReader = command.ExecuteReader
        If reader.Read Then
            TextBox1.Text = reader("ISBN").ToString
            TextBox2.Text = reader("NIM").ToString
            TextBox3.Text = reader("tanggal_pinjam").ToString
            TextBox4.Text = reader("tanggal_kembali").ToString
            RadioButtonList1.SelectedValue = reader("status_kembali").ToString
        Else
            MsgBox("Data peminjaman dengan ID " & TextBox5.Text & " tidak ditemukan.", MsgBoxStyle.Information)
        End If
    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim edit As String = "UPDATE peminjaman SET ISBN = '" & TextBox1.Text & "', NIM = '" & TextBox2.Text & "', status_kembali = '" & RadioButtonList1.SelectedValue & "' WHERE id_pinjam = '" & TextBox5.Text & "' "
        Dim cmdEdit As New MySqlCommand(edit, koneksi)
        cmdEdit.ExecuteNonQuery()
        Dim statusPinjam As Integer = 0
        If RadioButtonList1.SelectedValue = statusPinjam Then
            Dim pinjam As String = "UPDATE buku SET status_pinjam = 1 WHERE ISBN = '" & TextBox1.Text & "'"
            Dim cmdPinjam As New MySqlCommand(pinjam, koneksi)
            cmdPinjam.ExecuteNonQuery()
        Else
            Dim kembali As String = "UPDATE buku SET status_pinjam = 0 WHERE ISBN = '" & TextBox1.Text & "'"
            Dim cmdKembali As New MySqlCommand(kembali, koneksi)
            cmdKembali.ExecuteNonQuery()
        End If
        MsgBox("Data peminjaman dengan ID " & TextBox5.Text & "  berhasil diperbarui.", MsgBoxStyle.Information)
        RadioButtonList1.SelectedIndex = 0
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        koneksi.Close()
    End Sub

    Protected Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim hapus As String = "DELETE FROM peminjaman WHERE id_pinjam = '" & TextBox5.Text & "'"
        Dim cmdHapus As New MySqlCommand(hapus, koneksi)
        cmdHapus.ExecuteNonQuery()
        Dim statusPinjam As Integer = 0
        If RadioButtonList1.SelectedValue = statusPinjam Then
            Dim kembali As String = "UPDATE buku SET status_pinjam = 0 WHERE ISBN = '" & TextBox1.Text & "'"
            Dim cmdKembali As New MySqlCommand(kembali, koneksi)
            cmdKembali.ExecuteNonQuery()
        End If
        MsgBox("Data peminjaman dengan ID " & TextBox5.Text & " berhasil dihapus.", MsgBoxStyle.Information)
        RadioButtonList1.SelectedIndex = 0
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        koneksi.Close()
    End Sub

    Protected Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        Dim count As MySqlCommand
        koneksi.Open()
        Dim adapter As MySqlDataAdapter
        If DropDownList1.SelectedIndex = 0 Then
            MsgBox("Pilih tahun!", MsgBoxStyle.Information)
            DropDownList1.Focus()
        Else
            If DropDownList2.SelectedIndex = 0 And DropDownList3.SelectedIndex = 0 Then
                Dim tahun As String = "SELECT * FROM peminjaman WHERE YEAR(tanggal_pinjam) = '" & DropDownList1.SelectedValue & "'"
                count = New MySqlCommand("SELECT COUNT(*) FROM peminjaman WHERE YEAR(tanggal_pinjam) = '" & DropDownList1.SelectedValue & "'", koneksi)
                adapter = New MySqlDataAdapter(tahun, koneksi)
            ElseIf DropDownList2.SelectedIndex = 0 And Not DropDownList3.SelectedIndex = 0 Then
                MsgBox("Pilih bulan!", MsgBoxStyle.Information)
                DropDownList1.Focus()
            Else
                If DropDownList3.SelectedIndex = 0 Then
                    Dim bulan As String = "SELECT * FROM peminjaman WHERE YEAR(tanggal_pinjam) = '" & DropDownList1.SelectedValue & "' AND MONTH(tanggal_pinjam)= '" & DropDownList2.SelectedIndex & "'"
                    count = New MySqlCommand("SELECT COUNT(*) FROM peminjaman WHERE YEAR(tanggal_pinjam) = '" & DropDownList1.SelectedValue & "' AND MONTH(tanggal_pinjam)= '" & DropDownList2.SelectedIndex & "'", koneksi)
                    adapter = New MySqlDataAdapter(bulan, koneksi)
                Else
                    Dim tanggal As String = "SELECT * FROM peminjaman WHERE YEAR(tanggal_pinjam) = '" & DropDownList1.SelectedValue & "' AND MONTH(tanggal_pinjam)= '" & DropDownList2.SelectedIndex & "' AND DAY(tanggal_pinjam)= '" & DropDownList3.SelectedValue & "'"
                    count = New MySqlCommand("SELECT COUNT(*) FROM peminjaman WHERE YEAR(tanggal_pinjam) = '" & DropDownList1.SelectedValue & "' AND MONTH(tanggal_pinjam)= '" & DropDownList2.SelectedIndex & "' AND DAY(tanggal_pinjam)= '" & DropDownList3.SelectedValue & "'", koneksi)
                    adapter = New MySqlDataAdapter(tanggal, koneksi)
                End If
            End If
        End If
        Dim ds As New DataSet
        adapter.Fill(ds)
        Dim tabel As DataTable = ds.Tables(0)
        Label1.Text = count.ExecuteScalar().ToString()
        GridView1.DataSource = tabel
        GridView1.DataBind()
        adapter.Dispose()
        koneksi.Close()
    End Sub
End Class