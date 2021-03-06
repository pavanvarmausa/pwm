/*
 * Password Management Servlets (PWM)
 * http://www.pwm-project.org
 *
 * Copyright (c) 2006-2009 Novell, Inc.
 * Copyright (c) 2009-2018 The PWM Project
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

package password.pwm.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class TokenVerificationProgress implements Serializable
{
    private Set<TokenChannel> passedTokens = new HashSet<>();
    private Set<TokenChannel> issuedTokens = new HashSet<>();
    private TokenChannel phase;
    private String tokenDisplayText;

    public enum TokenChannel
    {
        EMAIL,
        SMS,
    }

    public Set<TokenChannel> getPassedTokens( )
    {
        return passedTokens;
    }

    public Set<TokenChannel> getIssuedTokens( )
    {
        return issuedTokens;
    }

    public TokenChannel getPhase( )
    {
        return phase;
    }

    public void setPhase( final TokenChannel phase )
    {
        this.phase = phase;
    }

    public String getTokenDisplayText( )
    {
        return tokenDisplayText;
    }

    public void setTokenDisplayText( final String tokenDisplayText )
    {
        this.tokenDisplayText = tokenDisplayText;
    }
}
