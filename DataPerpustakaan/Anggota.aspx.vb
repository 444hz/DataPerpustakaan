Imports MySql
Imports MySql.Data
Imports MySql.Data.MySqlClient
Public Class Anggota
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Then
            MsgBox("NIM tidak boleh kosong!", MsgBoxStyle.Information)
            TextBox1.Focus()
        Else
            If TextBox2.Text = "" Then
                MsgBox("Nama mahasiswa harus diisi!", MsgBoxStyle.Information)
                TextBox2.Focus()
            Else
                If DropDownList1.SelectedIndex = 0 Then
                    MsgBox("Pilih salah satu fakultas!", MsgBoxStyle.Information)
                    DropDownList1.Focus()
                Else
                    If TextBox3.Text = "" Then
                        MsgBox("Tanggal lahir harus diisi!", MsgBoxStyle.Information)
                        TextBox3.Focus()
                    Else
                        If TextBox4.Text = "" Then
                            MsgBox("No. HP tidak boleh kosong!", MsgBoxStyle.Information)
                            TextBox4.Focus()
                        Else
                            Dim koneksi1 As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                            koneksi1.Open()
                            Dim cari As String = "SELECT * FROM mahasiswa WHERE NIM = '" & TextBox1.Text & "'"
                            Dim command1 As New MySqlCommand(cari, koneksi1)
                            Dim reader1 As MySqlDataReader = command1.ExecuteReader
                            If reader1.Read Then
                                MsgBox("Anggota dengan NIM " & TextBox2.Text & " sudah tersimpan di database.", MsgBoxStyle.Information)
                                TextBox2.Focus()
                            Else
                                Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                                koneksi.Open()
                                Dim input As String = "INSERT INTO mahasiswa(NIM, nama, fakultas, tanggal_lahir, no_telp) VALUES('" & TextBox1.Text & "','" & TextBox2.Text & "','" & DropDownList1.SelectedValue & "','" & TextBox3.Text & "','" & TextBox4.Text & "')"
                                Dim command As New MySqlCommand(input, koneksi)
                                Dim reader As MySqlDataReader = command.ExecuteReader
                                MsgBox("Data anggota, " & TextBox1.Text & " berhasil disimpan.", MsgBoxStyle.Information)
                                TextBox1.Text = ""
                                DropDownList1.SelectedIndex = 0
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
        Dim tampil As String = "SELECT * FROM mahasiswa"
        Dim count As New MySqlCommand("SELECT COUNT(*) FROM mahasiswa", koneksi)
        Dim max As New MySqlCommand("SELECT MAX(YEAR(CURRENT_DATE)- YEAR(tanggal_lahir)) FROM mahasiswa", koneksi)
        Dim min As New MySqlCommand("SELECT MIN(YEAR(CURRENT_DATE)- YEAR(tanggal_lahir)) FROM mahasiswa", koneksi)
        Dim avg As New MySqlCommand("SELECT AVG(YEAR(CURRENT_DATE)- YEAR(tanggal_lahir)) FROM mahasiswa", koneksi)
        Dim sum As New MySqlCommand("SELECT AVG(YEAR(CURRENT_DATE)- YEAR(tanggal_lahir)) FROM mahasiswa", koneksi)
        Dim adapter As New MySqlDataAdapter(tampil, koneksi)
        Dim ds As New DataSet
        adapter.Fill(ds)
        Dim tabel As DataTable = ds.Tables(0)
        Label1.Text = count.ExecuteScalar().ToString()
        Label2.Text = max.ExecuteScalar().ToString()
        Label3.Text = min.ExecuteScalar().ToString()
        Label4.Text = avg.ExecuteScalar().ToString()
        Label5.Text = sum.ExecuteScalar().ToString()
        GridView1.DataSource = tabel
        GridView1.DataBind()
        adapter.Dispose()
        koneksi.Close()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim edit As String = "UPDATE mahasiswa SET nama = '" & TextBox2.Text & "', fakultas = '" & DropDownList1.SelectedValue & "', tanggal_lahir = '" & TextBox3.Text & "', no_telp = '" & TextBox4.Text & "'  WHERE NIM = '" & TextBox1.Text & "' "
        Dim command As New MySqlCommand(edit, koneksi)
        command.ExecuteNonQuery()
        MsgBox("Data anggota dengan NIM " & TextBox1.Text & " berhasil diperbarui.", MsgBoxStyle.Information)
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
        Dim hapus As String = "DELETE FROM mahasiswa WHERE NIM = '" & TextBox1.Text & "' "
        Dim command As New MySqlCommand(hapus, koneksi)
        command.ExecuteNonQuery()
        MsgBox("Data anggota dengan NIM " & TextBox1.Text & " berhasil dihapus.", MsgBoxStyle.Information)
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
        Dim cari As String = "SELECT * FROM mahasiswa WHERE NIM = '" & TextBox1.Text & "'"
        Dim command1 As New MySqlCommand(cari, koneksi)
        Dim reader1 As MySqlDataReader = command1.ExecuteReader
        If reader1.Read Then
            TextBox1.Text = reader1("NIM").ToString
            TextBox2.Text = reader1("nama").ToString
            TextBox3.Text = reader1("tanggal_lahir").ToString
            TextBox4.Text = reader1("no_telp").ToString
            DropDownList1.SelectedValue = reader1("fakultas").ToString
        Else
            MsgBox("Data anggota dengan NIM " & TextBox1.Text & " tidak ditemukan.", MsgBoxStyle.Information)
        End If
    End Sub
End Class