class Invoice < ApplicationRecord
    # Digunakan untuk mengganti tampilan ID bawaan Rails dengan tampilan ID Custom
    extend FriendlyId
    friendly_id :reference_number, use: [:slugged, :finders]

    # FK dari Student dan Exchequer (Bendahara)
    belongs_to :student
    belongs_to :exchequer
    
    has_many :invoice_items_details, dependent: :destroy
    # has_many :expenses, through: :invoice_items_details

    validate :ensure_generate_reference_number

    def ensure_generate_reference_number
        self.reference_number ||= generate_reference_number_from_payload
    end
    
    private

    def generate_reference_number_from_payload
        # loop do
        10.times do
            # payload = "#{self.student.user.personal_token}:#{DateTime.now}"
            # gener2qate = Digest::SHA1.hexdigest(payload)
            generate = "DR-#{DateTime.now.strftime("%d%M%Y")}-#{rand(10000)}"
            break generate unless Invoice.where(reference_number: generate).first
        end
    end
end