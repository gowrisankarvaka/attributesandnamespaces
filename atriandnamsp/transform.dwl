%dw 2.0
output application/xml
ns env http://www.w3.org/2003/05/soap-envelope
ns m http://travelcompany.example.org/reservation
ns role http://www.w3.org/2003/05/soap-envelope/role/next
ns mustUnderstand true
ns n http://mycompany.example.com/employees
ns p http://travelcompany.example.org/reservation/travel
ns q http://travelcompany.example.org/reservation/hotels
---
env#Envelope:
{
    env#header:
    {
       m#reservation @(env#role:role,env#mustUnderstand:mustUnderstand):
       {
           m#reference:payload.Envelope.Header.reservation.reference,
           m#dateTime: payload.Envelope.Header.reservation.dateAndTime
       },
       n#passenger @(env#role:role,env#mustUnderstand:mustUnderstand):
       {
           n#Name: payload.Envelope.Header.passenger.name
       }
    },
    env#body:
    {
        p#itinarery:
        {
            p#departure:
            {
                p#departing: payload.Envelope.Body.itinerary.departure.departing,
                p#arriving: payload.Envelope.Body.itinerary.departure.arriving,
                p#departureDate: payload.Envelope.Body.itinerary.departure.departureDate,
                p#departureTime: payload.Envelope.Body.itinerary.departure.departureTime,
                p#seatPreference: payload.Envelope.Body.itinerary.departure.seatPreference
            },
            p#return:
            {
                p#departing: payload.Envelope.Body.itinerary.return.departing,
                p#arriving: payload.Envelope.Body.itinerary.return.arriving,
                p#departureDate: payload.Envelope.Body.itinerary.return.departureDate,
                p#departureTime: payload.Envelope.Body.itinerary.return.departureTime,
                p#seatPreference: payload.Envelope.Body.itinerary.return.seatPreference
            }
        },
            q#lodging:
            {
                q#reference: payload.Envelope.Body.lodging.preference
            }
    }
}