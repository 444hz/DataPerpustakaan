Imports MySql
Imports MySql.Data
Imports MySql.Data.MySqlClient
Public Class Buku
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Then
            MsgBox("Judul buku tidak boleh kosong!", MsgBoxStyle.Information)
            TextBox1.Focus()
        Else
            If DropDownList1.SelectedIndex = 0 Then
                MsgBox("Pilih salah satu genre!", MsgBoxStyle.Information)
                DropDownList1.Focus()
            Else
                If TextBox2.Text = "" Then
                    MsgBox("ISBN harus diisi!", MsgBoxStyle.Information)
                    TextBox2.Focus()
                Else
                    If TextBox3.Text = "" Then
                        MsgBox("Pengarang harus diisi!", MsgBoxStyle.Information)
                        TextBox3.Focus()
                    Else
                        If TextBox4.Text = "" Then
                            MsgBox("Penerbit tidak boleh kosong!", MsgBoxStyle.Information)
                            TextBox4.Focus()
                        Else
                            Dim koneksi1 As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                            koneksi1.Open()
                            Dim cari As String = "SELECT * FROM buku WHERE ISBN = '" & TextBox2.Text & "'"
                            Dim command1 As New MySqlCommand(cari, koneksi1)
                            Dim reader1 As MySqlDataReader = command1.ExecuteReader
                            If reader1.Read Then
                                MsgBox("Buku dengan ISBN " & TextBox2.Text & " sudah tersimpan di database.", MsgBoxStyle.Information)
                                TextBox2.Focus()
                            Else
                                Dim koneksi2 As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                                koneksi2.Open()
                                Dim cari1 As String = "SELECT * FROM pengarang WHERE nama = '" & TextBox3.Text & "'"
                                Dim command2 As New MySqlCommand(cari1, koneksi2)
                                Dim reader2 As MySqlDataReader = command2.ExecuteReader
                                If Not reader2.Read Then
                                    MsgBox("Pengarang dengan nama " & TextBox3.Text & " belum tersimpan. Tambahkan pengarang baru!", MsgBoxStyle.Information)
                                    TextBox3.Focus()
                                    koneksi2.Close()
                                Else
                                    Dim koneksi3 As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                                    koneksi3.Open()
                                    Dim cari2 As String = "SELECT * FROM penerbit WHERE nama = '" & TextBox4.Text & "'"
                                    Dim command3 As New MySqlCommand(cari2, koneksi3)
                                    Dim reader3 As MySqlDataReader = command3.ExecuteReader
                                    If Not reader3.Read Then
                                        MsgBox("Penerbit " & TextBox4.Text & " belum tersimpan. Tambahkan penerbit baru!", MsgBoxStyle.Information)
                                        TextBox4.Focus()
                                    Else
                                        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                                        koneksi.Open()
                                        Dim input As String = "INSERT INTO buku(judul, genre, ISBN, pengarang, penerbit, status_pinjam) VALUES('" & TextBox1.Text & "','" & DropDownList1.SelectedValue & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "','" & RadioButtonList1.SelectedValue & "')"
                                        Dim command As New MySqlCommand(input, koneksi)
                                        Dim reader As MySqlDataReader = command.ExecuteReader
                                        MsgBox("Data buku dengan judul " & TextBox1.Text & " berhasil disimpan.", MsgBoxStyle.Information)
                                        TextBox1.Text = ""
                                        DropDownList1.SelectedIndex = 0
                                        TextBox2.Text = ""
                                        TextBox3.Text = ""
                                        TextBox4.Text = ""
                                        RadioButtonList1.SelectedIndex = 1
                                        koneksi.Close()
                                    End If
                                End If
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
        Dim tampil As String = "SELECT * FROM buku"
        Dim count As New MySqlCommand("SELECT COUNT(*) FROM buku", koneksi)
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

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim hapus As String = "UPDATE buku SET judul = '" & TextBox1.Text & "', genre = '" & DropDownList1.SelectedValue & "', pengarang = '" & TextBox3.Text & "', penerbit = '" & TextBox4.Text & "', status_pinjam'" & RadioButtonList1.SelectedValue & "' WHERE ISBN = '" & TextBox2.Text & "'"
        Dim command As New MySqlCommand(hapus, koneksi)
        command.ExecuteNonQuery()
        MsgBox("Data buku dengan judul " & TextBox1.Text & " berhasil diperbarui.", MsgBoxStyle.Information)
        RadioButtonList1.SelectedIndex = 1
        DropDownList1.SelectedIndex = 0
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        koneksi.Close()
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim hapus As String = "DELETE FROM buku WHERE judul = '" & TextBox1.Text & "' "
        Dim command As New MySqlCommand(hapus, koneksi)
        command.ExecuteNonQuery()
        MsgBox("Data buku dengan judul " & TextBox1.Text & " berhasil dihapus.", MsgBoxStyle.Information)
        RadioButtonList1.SelectedIndex = 1
        DropDownList1.SelectedIndex = 0
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        koneksi.Close()
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim cari As String = "SELECT * FROM buku WHERE judul = '" & TextBox1.Text & "'"
        Dim command As New MySqlCommand(cari, koneksi)
        Dim reader As MySqlDataReader = command.ExecuteReader
        If reader.Read Then
            TextBox1.Text = reader("judul").ToString
            TextBox2.Text = reader("ISBN").ToString
            TextBox3.Text = reader("penerbit").ToString
            TextBox4.Text = reader("pengarang").ToString
            DropDownList1.SelectedValue = reader("genre").ToString
            RadioButtonList1.SelectedValue = reader("status_pinjam").ToString
        Else
            MsgBox("Data buku dengan judul " & TextBox2.Text & " tidak ditemukan.", MsgBoxStyle.Information)
        End If
    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim tampil As String = "SELECT * FROM buku WHERE status_pinjam = 0"
        Dim adapter As New MySqlDataAdapter(tampil, koneksi)
        Dim ds As New DataSet
        adapter.Fill(ds)
        Dim tabel As DataTable = ds.Tables(0)
        GridView1.DataSource = tabel
        GridView1.DataBind()
        adapter.Dispose()
        koneksi.Close()
    End Sub

    Protected Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim tampil As String = "SELECT buku.judul, buku.ISBN, mahasiswa.NIM, mahasiswa.nama, buku.status_pinjam FROM buku LEFT JOIN peminjaman ON buku.ISBN = peminjaman.ISBN LEFT JOIN mahasiswa ON peminjaman.NIM = mahasiswa.NIM WHERE Buku.status_pinjam = 1 AND (peminjaman.ISBN, peminjaman.tanggal_pinjam) IN (SELECT ISBN, MAX(tanggal_pinjam) FROM peminjaman GROUP BY ISBN)"
        Dim adapter As New MySqlDataAdapter(tampil, koneksi)
        Dim ds As New DataSet
        adapter.Fill(ds)
        Dim tabel As DataTable = ds.Tables(0)
        GridView1.DataSource = tabel
        GridView1.DataBind()
        adapter.Dispose()
        koneksi.Close()
    End Sub
End Class