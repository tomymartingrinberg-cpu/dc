PORTNAME=	avion
DISTVERSION=	v1.0
CATEGORIES=	misc

MAINTAINER=	Tomy <tomy.martin.grinberg@.com>
COMMENT=	ASCII airplane animation in Bash
LICENSE=	Toyoda

RUN_DEPENDS=	bash:shells/bash

USE_GITHUB=	yes
GH_ACCOUNT=	tomasmartingrinberg-cpu
GH_PROJECT=	dc

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/dc.sh ${STAGEDIR}${PREFIX}/bin/avion

.include <bsd.port.mk>
