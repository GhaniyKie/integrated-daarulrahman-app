json.daftar_tagihan do
    json.total_tagihan @total
    json.detail_tagihan @unpaids do |tagihan|
        json.id_tagihan                   tagihan.id_tagihan
        json.tanggal_faktur               I18n.l(tagihan.created_at.to_date)
        json.nominal                      tagihan.payment_type.nominal_biaya
        json.url                          api_v1_student_invoice_url(id: tagihan.id_tagihan)
    end
end