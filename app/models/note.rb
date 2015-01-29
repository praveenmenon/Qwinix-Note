class Note < ActiveRecord::Base
  belongs_to :user

  validates :title,
	:presence =>true,
	:length =>{:maximum=> 50, :minimum=> 4},
	 :format => {:with => ConfigCenter::GeneralValidations::NAME_FORMAT_REG_EXP}

	validates :description,
	:presence =>true,
	:length =>{:maximum=> 500, :minimum=> 4},
	 :format => {:with => ConfigCenter::GeneralValidations::NAME_FORMAT_REG_EXP}
end
