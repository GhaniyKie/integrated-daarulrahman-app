json.keterangan do
    json.id_tagihan        @unpaid.id_tagihan
    json.id_siswa          @unpaid.student_id
    json.tanggal_faktur    I18n.l(@unpaid.created_at.to_date)


    json.detail_tagihan do
        json.tagihan       @payment_type.jenis_pembayaran
        json.nominal       @payment_type.nominal_biaya
        json.keterangan    @payment_type.deskripsi
    end
end