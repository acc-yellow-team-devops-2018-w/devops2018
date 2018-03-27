import jenkins.model.*
import hudson.security.*
import org.jenkinsci.plugins.*


String server = 'ldap://openldap'
String rootDN = 'dc=mvp,dc=org'
String userSearchBase = 'ou=users'
String userSearch = ''
String groupSearchBase = ''
String managerDN = 'cn=admin,dc=mvp,dc=org'
String managerPassword = 'admin'
boolean inhibitInferRootDN = false

SecurityRealm ldapRealm = new LDAPSecurityRealm(
                                                server,
                                                rootDN,
                                                userSearchBase,
                                                userSearch,
                                                groupSearchBase,
                                                managerDN,
                                                managerPassword,
                                                inhibitInferRootDN
                                               )

Jenkins.instance.setSecurityRealm(ldapRealm)
Jenkins.instance.save()

