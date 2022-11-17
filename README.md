# Tugas 7: Elemen Dasar Flutter

## Ramya Nareswari W. (2106751606)

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

Stateless Widget adalah sebagai Widget yang tidak dapat dirubah. Contohnya adalah navigasi karena konten navigasi tidak ada perubahan secara berkala<br/><br/>
Stateful widget adalah widget yang dapat berubah. Contohnya adalah tampilan yang berubah atau warna text yang berubah. Pada widget ini dapat diterapkan setState. <br>

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

1. Scaffold: membuat tampilan dasar material design pada keseluruhan aplikasi
2. FloatingActionButton: membuat button floating yang dapat ditekan dan menjalankan fungsi
3. TextStyle: melakukan styling pada text


### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState() yang akan bertugas untuk memberi tanda pada widget bahwa ada state yang berubah, yaitu dalam hal ini variabel _counter yang setiap kali tombol decrementCounter atau incrementCounter ditekan, maka nilai berubah.

### Jelaskan perbedaan antara const dengan final.

Const tidak dapat diterapkan pada deklarasi sebuah variabel jika valuenya tidak diketahui saat compile, sedangkan final bisa diterapkan pada  deklarasi variabel (baik yang nilainya sudah diketahui maupun belum) pada saat waktu kompilasi berjalan.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Melakukan perintah flutter create app dan flutter run
2. Menambahkan widget Padding dan FloatingActionButton agar dapat diletakkan di kiri bawah dan kanan bawah.
3. Menambah variabel _counter dan useState untuk increment dan decrement
4. Melakukan styling untuk tulisan ganjil/genap
5. Menerapkan bonus dengan menerapkan if-else operator dan menambahkan remove pada button

# Tugas 8: Flutter Form
### Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`
`Navigator.push` berfungsi untuk melakukan push sebuah routing (halaman) ke top of stack navigation. `Navigator.pushReplacement` berfungsi untuk mereplace route yang sedang ditampilkan.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. Drawer = membuat menu pada sisi kiri aplikasi sebagainavigasi.
2. ListViewBuilder = menampilkan data dari form (dengan kata lain menampilkan widget children)
3. ListTile = Widget ini merupakan widget yang dapat menampilkan 1-3 baris teks dalam sebuah list.
4. TextFormField = menerima input teks
5. Icon = widget untuk menampilkan ikon.
6. DropdownButton = menampilkan pilihan input.


###  Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed)
onSaved, onHover, onPressed, dan onTap.

### Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Halaman dikenal dengan istilah `routes` pada Flutter. 

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat page untuk form pada `tambah.dart`. Form berisi input yang menerima judul budget (string), nominal budget (int), jenisBudget (string) dengan pilihan pemasukan atau pengeluaran, dan tanggal dalma bentuk date picker.
2. Menampilkan data dari submisi form dengan ListView builder
3. Membuat drawer dengan code sebagai berikut
```dart
drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman data
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetDataPage()),
                );
              },
            ),
          ],
        ),
      ),
```