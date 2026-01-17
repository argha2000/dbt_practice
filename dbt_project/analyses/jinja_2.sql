{% set apples = ["Gala", "Fuji", "Granny Smith","McIntosh","Honeycrisp"] %}

{% for i in apples %}
    {%if i != "McIntosh"%}
        {{- i }}
    {% else %}
        I hate {{ i }}
    {% endif %}
{% endfor %}