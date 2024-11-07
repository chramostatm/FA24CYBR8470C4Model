!const ORGANISATION_NAME "GeneralHospital"
!const GROUPA_NAME "Providers"

workspace {

    model {
        providers = group "${ORGANISATION_NAME} - ${GROUPA_NAME}" {
            Nurse = person "Nurse"
            Clinician = person "Clinician"
            Doctor = person "Doctor"
        }
        patient = person "Patient"
        
        EHRSystem = softwareSystem "EHR" {
            pap = container "Patient portal" "Where the patient views doctor's notes and upcoming appointments"{
                pap_auth = component "Authentication Protocols"
            }
            databases = container "Database(s)"
            prp = container "Provider portals" {
                prp_auth = component "Authentication Protocols"
                Dop = component "Doctor's Page"
                Nup = component "Nurse's Page"
                Clp = component "Clinician's Page"
            }
            
         }
        PaymentSystem = softwareSystem "Payment Processing System"{
            inetpayment = container "Internet Payment system"
            phonepayment = container "Phone Payment system"
        }
         
         
        patient -> pap "uses"
        pap -> patient "notifies"
        pap -> databases "reads from"
        patient -> pap_auth "uses"
        Nurse -> prp "uses"
        Clinician -> prp "uses"
        Doctor -> prp "uses"
        prp -> databases "reads from and writes to"
        pap -> PaymentSystem "redirects payment to"
        
        Doctor -> prp_auth "authenticates"
        Nurse -> prp_auth "authenticates"
        Clinician -> prp_auth "authenticates"
        prp_auth -> Dop "If Doctor"
        prp_auth -> Nup "If Nurse"
        prp_auth -> Clp "If Clinician"
        Dop -> databases "reads notes, enters notes, enters orders"
        Nup ->  databases "enters patient notes"
        Clp -> databases "enters room notes"
    }

}