json.detail_pembayaran do
    json.id                 @payment_type.id
    json.jenis_pembayaran   @payment_type.jenis_pembayaran
    json.nominal_biaya      @payment_type.nominal_biaya
    json.deskripsi          @payment_type.deskripsi
end