// Display Time
function displayTime(){
    var nmbulan = new Array();
    
    nmbulan[0] = "Januari";
    nmbulan[1] = "Februari";
    nmbulan[2] = "Maret";
    nmbulan[3] = "April";
    nmbulan[4] = "Mei";
    nmbulan[5] = "Juni";
    nmbulan[6] = "Juli";
    nmbulan[7] = "Augustus";
    nmbulan[8] = "September";
    nmbulan[9] = "Oktober";
    nmbulan[10] = "Nopember";
    nmbulan[11] = "Desember";
    
    var nmhari = new Array(7);
    nmhari[0] = "Minggu";
    nmhari[1] = "Senin";
    nmhari[2] = "Selasa";
    nmhari[3] = "Rabu";
    nmhari[4] = "Kamis";
    nmhari[5] = "Jum’at";
    nmhari[6] = "Sabtu";
    
    var waktu = new Date();
    
    var jam = waktu.getHours() + "";
    var menit = waktu.getMinutes() + "";
    var detik = waktu.getSeconds() + "";
    
    document.getElementById("tampilanjam").innerHTML = (jam.length==1?"0"+jam:jam) + ":" + (menit.length==1?"0"+menit:menit) + ":" + (detik.length==1?"0"+detik:detik);
    
    var tgl = waktu.getDate() + "";
    var bulan = nmbulan[waktu.getMonth()];
    var tahun = waktu.getFullYear() + "";
    
    document.getElementById("tampilantgl").innerHTML = (tgl.length==1?"0"+tgl:tgl) + " " + (bulan.length==1?"0"+bulan:bulan) + " " + (tahun.length==1?"0"+tahun:tahun);
    
    var hari = nmhari[waktu.getDay()];
    document.getElementById("tampilanhari").innerHTML = (hari.length==1?"0"+hari:hari);
}