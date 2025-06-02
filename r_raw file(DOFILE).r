# Liberty International Research Internship Assessment - Part 2
# Statistical Analysis: GDP per Capita Relationships
# ================================================

# Load required libraries
library(ggplot2)
library(corrplot)
library(gridExtra)

# Create the dataset
data <- data.frame(
  Country = c("Singapore", "United States", "Germany", "Estonia", "Uruguay", 
              "Chile", "Argentina", "Mexico", "Brazil", "Georgia", 
              "Peru", "Botswana", "Egypt", "India", "Venezuela"),
  GDP_per_capita = c(84734, 82769, 54343, 30133, 22798, 17068, 14187, 13790, 
                     10295, 8284, 7907, 7820, 3457, 2481, 15944),
  Economic_Freedom = c(83.5, 70.1, 72.1, 77.8, 69.8, 71.4, 49.9, 62.0, 
                       53.2, 68.4, 64.8, 68.0, 49.7, 52.9, 28.1),
  Gini_Index = c(36.4, 41.3, 32.4, 31.8, 40.6, 43.0, 40.7, 43.5, 
                 52.0, 33.5, 40.3, 53.3, 31.9, 32.8, 44.7),
  Business_Freedom = c(86.9, 84.8, 84.2, 83.2, 83.9, 79.2, 55.5, 71.2, 
                       67.0, 74.4, 69.5, 66.0, 48.9, 68.3, 31.0),
  Trade_Freedom = c(95.0, 75.6, 79.2, 79.2, 71.2, 78.0, 58.6, 76.8, 
                    66.8, 86.4, 81.4, 78.8, 60.2, 62.2, 42.2),
  Corruption_Index = c(83, 65, 75, 73, 73, 63, 42, 26, 34, 56, 38, 53, 31, 39, 10)
)

# Display basic statistics
print("=== DATASET OVERVIEW ===")
print(summary(data[,-1]))  # Exclude country names from summary

# ================================================
# 1. SIMPLE LINEAR REGRESSIONS
# ================================================

# GDP vs Economic Freedom
reg1 <- lm(GDP_per_capita ~ Economic_Freedom, data = data)
print("=== GDP vs Economic Freedom ===")
print(summary(reg1))

# GDP vs Gini Index
reg2 <- lm(GDP_per_capita ~ Gini_Index, data = data)
print("=== GDP vs Gini Index ===")
print(summary(reg2))

# GDP vs Business Freedom
reg3 <- lm(GDP_per_capita ~ Business_Freedom, data = data)
print("=== GDP vs Business Freedom ===")
print(summary(reg3))

# GDP vs Trade Freedom
reg4 <- lm(GDP_per_capita ~ Trade_Freedom, data = data)
print("=== GDP vs Trade Freedom ===")
print(summary(reg4))

# GDP vs Corruption Index
reg5 <- lm(GDP_per_capita ~ Corruption_Index, data = data)
print("=== GDP vs Corruption Index ===")
print(summary(reg5))

# ================================================
# 2. SCATTER PLOTS WITH TREND LINES
# ================================================

# Create scatter plots
p1 <- ggplot(data, aes(x = Economic_Freedom, y = GDP_per_capita)) +
  geom_point(size = 3, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "GDP per Capita vs Economic Freedom Score",
       x = "Economic Freedom Score", 
       y = "GDP per Capita (USD)") +
  theme_minimal() +
  annotate("text", x = min(data$Economic_Freedom), y = max(data$GDP_per_capita),
           label = paste("R² =", round(summary(reg1)$r.squared, 3)), 
           hjust = 0, vjust = 1)

p2 <- ggplot(data, aes(x = Gini_Index, y = GDP_per_capita)) +
  geom_point(size = 3, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "GDP per Capita vs Gini Index",
       x = "Gini Index (Income Inequality)", 
       y = "GDP per Capita (USD)") +
  theme_minimal() +
  annotate("text", x = min(data$Gini_Index), y = max(data$GDP_per_capita),
           label = paste("R² =", round(summary(reg2)$r.squared, 3)), 
           hjust = 0, vjust = 1)

p3 <- ggplot(data, aes(x = Business_Freedom, y = GDP_per_capita)) +
  geom_point(size = 3, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "GDP per Capita vs Business Freedom",
       x = "Business Freedom Score", 
       y = "GDP per Capita (USD)") +
  theme_minimal() +
  annotate("text", x = min(data$Business_Freedom), y = max(data$GDP_per_capita),
           label = paste("R² =", round(summary(reg3)$r.squared, 3)), 
           hjust = 0, vjust = 1)

p4 <- ggplot(data, aes(x = Trade_Freedom, y = GDP_per_capita)) +
  geom_point(size = 3, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "GDP per Capita vs Trade Freedom",
       x = "Trade Freedom Score", 
       y = "GDP per Capita (USD)") +
  theme_minimal() +
  annotate("text", x = min(data$Trade_Freedom), y = max(data$GDP_per_capita),
           label = paste("R² =", round(summary(reg4)$r.squared, 3)), 
           hjust = 0, vjust = 1)

p5 <- ggplot(data, aes(x = Corruption_Index, y = GDP_per_capita)) +
  geom_point(size = 3, color = "blue") +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  labs(title = "GDP per Capita vs Corruption Perceptions Index",
       x = "Corruption Perceptions Index", 
       y = "GDP per Capita (USD)") +
  theme_minimal() +
  annotate("text", x = min(data$Corruption_Index), y = max(data$GDP_per_capita),
           label = paste("R² =", round(summary(reg5)$r.squared, 3)), 
           hjust = 0, vjust = 1)

# Display plots
print(p1)
print(p2)
print(p3)
print(p4)
print(p5)

# ================================================
# 3. MULTIPLE REGRESSION
# ================================================

# Multiple regression with all variables
multiple_reg <- lm(GDP_per_capita ~ Economic_Freedom + Gini_Index + 
                   Business_Freedom + Trade_Freedom + Corruption_Index, 
                   data = data)

print("=== MULTIPLE REGRESSION RESULTS ===")
print(summary(multiple_reg))

# ================================================
# 4. CORRELATION MATRIX
# ================================================

# Create correlation matrix
cor_matrix <- cor(data[,-1])  # Exclude country names
print("=== CORRELATION MATRIX ===")
print(round(cor_matrix, 3))

# Visualize correlation matrix
corrplot(cor_matrix, method = "color", type = "upper", 
         order = "hclust", tl.cex = 0.8, tl.col = "black")

# ================================================
# 5. SUMMARY OF KEY FINDINGS
# ================================================

print("=== KEY REGRESSION RESULTS SUMMARY ===")
cat("Simple Linear Regressions (R-squared values):\n")
cat("GDP vs Economic Freedom:    ", round(summary(reg1)$r.squared, 3), "\n")
cat("GDP vs Gini Index:          ", round(summary(reg2)$r.squared, 3), "\n")
cat("GDP vs Business Freedom:    ", round(summary(reg3)$r.squared, 3), "\n")
cat("GDP vs Trade Freedom:       ", round(summary(reg4)$r.squared, 3), "\n")
cat("GDP vs Corruption Index:    ", round(summary(reg5)$r.squared, 3), "\n")
cat("\nMultiple Regression R-squared: ", round(summary(multiple_reg)$r.squared, 3), "\n")
cat("Multiple Regression Adj R-squared: ", round(summary(multiple_reg)$adj.r.squared, 3), "\n")

# Extract coefficients for interpretation
coefs <- summary(multiple_reg)$coefficients
print("=== MULTIPLE REGRESSION COEFFICIENTS ===")
print(round(coefs, 4))

# END OF ANALYSIS