program GameLombaMenembak;
uses crt;

var
  pilihan, i, jumlahTembakan: integer;
  energi, skor: integer;
  inputUser: char;
  hasilTembakan: integer;

begin
  clrscr;
  randomize;
  
  writeln('GAME LOMBA MENEMBAK IKLC');
  
  // Menu pilihan tingkat kesulitan
  repeat
    writeln('Pilih tingkat kesulitan:');
    writeln('1. Mudah (1 tembakan)');
    writeln('2. Sedang (2 tembakan)');
    writeln('3. Sulit (3 tembakan)');
    write('Masukkan pilihan (1-3): ');
    readln(pilihan);
    
    if (pilihan < 1) or (pilihan > 3) then
    begin
      writeln('Pilihan tidak valid! Silakan pilih 1, 2, atau 3.');
      writeln;
    end;
  until (pilihan >= 1) and (pilihan <= 3);
  
  // Tentukan jumlah tembakan berdasarkan pilihan
  case pilihan of
    1: jumlahTembakan := 1;
    2: jumlahTembakan := 2;
    3: jumlahTembakan := 3;
  end;
  
  // Inisialisasi
  energi := 30;
  skor := 0;
  
  writeln;
  writeln('Mulai permainan!');
  writeln('Energi awal: ', energi);
  writeln('Skor awal: ', skor);
  writeln;
  
  // Proses tembakan
  for i := 1 to jumlahTembakan do
  begin
    writeln('Tembakan ke-', i);
    
    // Validasi input Y/N
    repeat
      write('Tekan Y untuk menembak, N untuk menyerah: ');
      readln(inputUser);
      inputUser := upcase(inputUser);
      
      if (inputUser <> 'Y') and (inputUser <> 'N') then
      begin
        writeln('Input tidak valid! Masukkan Y atau N.');
      end;
    until (inputUser = 'Y') or (inputUser = 'N');
    
    // Cek jika pemain menyerah
    if inputUser = 'N' then
    begin
      writeln('Kamu menyerah. Permainan berakhir lebih awal.');
      break;
    end;
    
    // Proses tembakan
    hasilTembakan := random(3); // 0, 1, atau 2
    
    case hasilTembakan of
      0: begin // Meleset
           writeln('Meleset! Tidak mendapat poin.');
           // Energi tetap
         end;
      1: begin // Kena pinggir
           writeln('Kena pinggir! +10 poin, -5 energi');
           skor := skor + 10;
           energi := energi - 5;
         end;
      2: begin // Tepat di tengah
           writeln('Tepat di tengah! +25 poin, -10 energi');
           skor := skor + 25;
           energi := energi - 10;
         end;
    end;
    
    // Tampilkan status terkini
    writeln('Energi sekarang: ', energi);
    writeln('Skor sekarang: ', skor);
    writeln;
    
    // Cek jika energi habis
    if energi <= 0 then
    begin
      writeln('Energi habis! Permainan berakhir.');
      exit;
    end;
  end;
  
  // Tampilkan hasil akhir
  writeln(' HASIL AKHIR ');
  writeln('Total skor: ', skor);
  writeln('Energi tersisa: ', energi);
  write('Keterangan: ');
  
  // Tentukan keterangan berdasarkan skor
  if skor >= 70 then
    writeln('Penembak Legendaris!')
  else if skor >= 50 then
    writeln('Penembak Handal.')
  else if skor >= 25 then
    writeln('Masih perlu latihan.')
  else
    writeln('Belum beruntung hari ini.');
    
  readln;
end.