json.pembayaran @payment_types do |pt|
    json.jenis_pembayaran   pt.jenis_pembayaran
    json.url                api_v1_payment_type_url(id:pt.id)
end