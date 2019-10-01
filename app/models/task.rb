class Task < ApplicationRecord
    
  before_validation :set_nameless_name

  validates :name, presence: true, length: {maximum: 30}
  validate :validate_name_not_including_comma

  belongs_to :user
  
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil) #ransack
    %w[name created_at]
  end

  def self.ransakable_assosiations(auth_object = nil)
    []
  end


  scope :recent, -> {order(created_at: :desc)}

  
  private
  
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含める事は出来ません') if name&.include?(',')
    end

    def set_nameless_name
      self.name = '名前なし' if name.blank?
    end
end