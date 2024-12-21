/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   printf_uns.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cpinho-c <cpinho-c@student.42.fr>          #+#  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024-12-12 12:07:44 by cpinho-c          #+#    #+#             */
/*   Updated: 2024-12-12 12:07:44 by cpinho-c         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "ft_printf.h"

static void	prt_nbr(unsigned int n);

int	printf_uns(unsigned int n)
{
	size_t	count;

	prt_nbr(n);
	count = 0;
	if (n == 0)
		return (1);
	while (n > 0)
	{
		n /= 10;
		count++;
	}
	return (count);
}

static void	prt_nbr(unsigned int n)
{
	if (n > 9)
	{
		prt_nbr(n / 10);
		prt_nbr(n % 10);
	}
	else
		ft_putchar_fd(n + '0', 1);
}
