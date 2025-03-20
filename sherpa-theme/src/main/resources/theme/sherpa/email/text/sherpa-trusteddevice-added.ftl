<#ftl output_format="plainText">
<#import "sherpa-template.ftl" as layout>
<@layout.emailLayout>
${msg("acmeTrustedDeviceAddedBody",user.username,trustedDeviceInfo.deviceName)}
</@layout.emailLayout>
