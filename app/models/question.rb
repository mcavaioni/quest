class Question < ActiveRecord::Base
  # belongs_to :user
  has_many :survey_questions
  has_many :surveys, through: :survey_questions
  has_one :answer

  validates :title, presence: true
  validates :content, presence: true, uniqueness: true, length: {minimum: 3, maximum: 300}


 Titles = ["Organization",
                    "Ownership",
                    "Corporate Governance",
                    "Employees",
                    "Administration/Operations",
                    "Third Party Relationships",
                    "Track Record",
                    "Risk Management",
                    "Operational Risk",
                    "Investment Research",
                    "Execution & Trading",
                    "Technology",
                    "Treasury",
                    "Compliance",
                    "Legal",
                    "Anti-Money Laundering",
                    "Insurance",
                    "Business Continuity",
                    "Fund Details",
                    "Fees",
                    "Share Class Terms",
                    "Fund Directors",
                    "Service Providers",
                    "Fund Administrator",
                    "Fund Pricing",
                    "Prime Broker",
                    "Custodian",
                    "Auditor",
                    "Legal Advisers",
                    "General",
                    "Promoters",
                    "Fund Assets",
                    "Capacity Management",
                    "Withdrawals",
                    "Management Team Co-Investment",
                    "Investor Breakdown",
                    "Fund Performance",
                    "Investment Strategy",
                    "Portfolio Construction",
                    "Leverage",
                    "Hedging",
                    "Liquidity",
                    "Diversification",
                    "External Controls",
                    "Investor Reporting",
                    "Taxation",
                    "DDQ"]
end
