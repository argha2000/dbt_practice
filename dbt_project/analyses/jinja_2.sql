{% set apples = ["Gala", "Fuji", "Granny Smith","McIntosh","Honeycrisp"] %}

{% for i in apples %}
    {{- i }}
{% endfor %}