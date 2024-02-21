# Price Class for calculate best price


class Price:

    def __init__(self, **kwargs):
        self.desired_profit_margin = kwargs.get("desired_profit_margin")
        self.cost_price = kwargs.get("cost_price")
        self.demand_factor = kwargs.get("demand_factor")
        self.market_best_price = kwargs.get("market_best_price")

    def calculate_price(self) -> float:
        # simple algorithm for pricing
        # machine learning should be used for future release
        adjusted_cost_price = self.cost_price * (
            1 + self.desired_profit_margin + self.demand_factor
        )
        competitive_price = min(adjusted_cost_price, self.market_best_price)
        return round(competitive_price, 2)
