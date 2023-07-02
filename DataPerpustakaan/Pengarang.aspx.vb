Imports MySql
Imports MySql.Data
Imports MySql.Data.MySqlClient
Public Class Pengarang
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Then
            MsgBox("Nama pengarang harus diisi!", MsgBoxStyle.Information)
            TextBox1.Focus()
        Else
            If TextBox2.Text = "" Then
                MsgBox("Tanggal lahir harus diisi!", MsgBoxStyle.Information)
                TextBox2.Focus()
            Else
                If TextBox3.Text = "" Then
                    MsgBox("Kebangsaan pengarang harus diisi!", MsgBoxStyle.Information)
                    TextBox3.Focus()
                Else
                    Dim koneksi1 As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                    koneksi1.Open()
                    Dim cari As String = "SELECT * FROM pengarang WHERE nama = '" & TextBox1.Text & "'"
                    Dim command1 As New MySqlCommand(cari, koneksi1)
                    Dim reader1 As MySqlDataReader = command1.ExecuteReader
                    If reader1.Read Then
                        MsgBox("Data pengarang, " & TextBox2.Text & " sudah tersimpan di database.", MsgBoxStyle.Information)
                        TextBox2.Focus()
                    Else
                        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
                        koneksi.Open()
                        Dim input As String = "INSERT INTO pengarang(nama, tanggal_lahir, kebangsaan) VALUES('" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "')"
                        Dim command As New MySqlCommand(input, koneksi)
                        Dim reader As MySqlDataReader = command.ExecuteReader
                        MsgBox("Data pengarang, " & TextBox1.Text & " berhasil disimpan.", MsgBoxStyle.Information)
                        TextBox1.Text = ""
                        TextBox2.Text = ""
                        TextBox3.Text = ""
                        koneksi.Close()
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim tampil As String = "SELECT * FROM pengarang"
        Dim count As New MySqlCommand("SELECT COUNT(*) FROM pengarang", koneksi)
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
        Dim edit As String = "UPDATE pengarang SET kebangsaan = '" & TextBox3.Text & "' WHERE nama = '" & TextBox1.Text & "' "
        Dim command As New MySqlCommand(edit, koneksi)
        command.ExecuteNonQuery()
        MsgBox("Data pengarang, " & TextBox1.Text & " berhasil diperbarui.", MsgBoxStyle.Information)
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        koneksi.Close()
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim hapus As String = "DELETE pengarang WHERE nama = '" & TextBox1.Text & "' "
        Dim command As New MySqlCommand(hapus, koneksi)
        command.ExecuteNonQuery()
        MsgBox("Data pengarang, " & TextBox1.Text & " berhasil diperbarui.", MsgBoxStyle.Information)
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        koneksi.Close()
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim koneksi As New MySqlConnection("data source=localhost;user=root;pwd='';initial catalog=perpus")
        koneksi.Open()
        Dim cari As String = "SELECT * FROM pengarang WHERE nama = '" & TextBox1.Text & "'"
        Dim command1 As New MySqlCommand(cari, koneksi)
        Dim reader1 As MySqlDataReader = command1.ExecuteReader
        If reader1.Read Then
            TextBox1.Text = reader1("nama").ToString
            TextBox2.Text = reader1("tanggal_lahir").ToString
            TextBox3.Text = reader1("kebangsaan").ToString
        Else
            MsgBox("Data pengarang, " & TextBox1.Text & " tidak ditemukan.", MsgBoxStyle.Information)
        End If
    End Sub
End Class