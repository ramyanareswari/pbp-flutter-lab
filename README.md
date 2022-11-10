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
2. MMenambahkan widget Padding dan FloatingActionButton agar dapat diletakkan di kiri bawah dan kanan bawah.
3. Menambah variabel _counter dan useState untuk increment dan decrement
4. Melakukan styling untuk tulisan ganjil/genap
5. Menerapkan bonus dengan menerapkan if-else operator dan menambahkan remove pada button