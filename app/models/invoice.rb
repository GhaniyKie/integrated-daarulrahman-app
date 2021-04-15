class Invoice < ApplicationRecord
    # FriendlyId digunakan untuk membuat tampilan URL ketika menampilkan antar entitas tidak menggunakan ID bawaan Rails
    extend FriendlyId
    friendly_id :id_tagihan, use: [:slugged, :finders]

    # Relasi dengan entitas Student dan Payment Types
    belongs_to :student
    belongs_to :payment_type

    validate :ensure_generate_id_tagihan

    def ensure_generate_id_tagihan
        self.id_tagihan ||= generate_id_tagihan_from_payload
    end
    
    private

    def generate_id_tagihan_from_payload
        loop do
            payload = "#{self.student.user.personal_token}:#{self.payment_type.id}:#{DateTime.now}"
            generate = Digest::SHA1.hexdigest(payload)
            break generate unless Invoice.where(id_tagihan: generate).first
        end
    end
end

# student.payment_type.sum(:nominal_biaya)