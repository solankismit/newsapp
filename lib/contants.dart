// Create dictionary for months number to string
const Map<int, String> months = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec',
};


const categories = [
  'General',
  'Business',
  'Entertainment',
  'Health',
  'Science',
  'Sports',
  'Technology'
];

const Map<String,String> catimg = {
  'General': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftimesofindia.indiatimes.com%2Findia%2Fbill-for-10-reservation-for-poor-in-general-category-challenged-in-sc%2Farticleshow%2F67470805.cms&psig=AOvVaw25VOCD3Dmj-w2-kF6GF7pi&ust=1689956345545000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCICr34_YnYADFQAAAAAdAAAAABAE',
  'Business': 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.latentview.com%2Fwp-content%2Fuploads%2F2023%2F04%2Funlocking-the-power-of-data-how-business-analytics-services-can-transform-your-business-featured-img-2.webp&tbnid=LBahQg3pnz0egM&vet=12ahUKEwjp74XR2J2AAxWuqGMGHfpiCqcQMygJegUIARCsAQ..i&imgrefurl=https%3A%2F%2Fwww.latentview.com%2Fcategory%2Fbusiness-analytics%2F&docid=9Vol-eg3KIcREM&w=882&h=576&itg=1&q=Business%20Category%20News%20Image&ved=2ahUKEwjp74XR2J2AAxWuqGMGHfpiCqcQMygJegUIARCsAQ',
  'Entertainment': 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.latentview.com%2Fwp-content%2Fuploads%2F2023%2F04%2Funlocking-the-power-of-data-how-business-analytics-services-can-transform-your-business-featured-img-2.webp&tbnid=LBahQg3pnz0egM&vet=12ahUKEwjp74XR2J2AAxWuqGMGHfpiCqcQMygJegUIARCsAQ..i&imgrefurl=https%3A%2F%2Fwww.latentview.com%2Fcategory%2Fbusiness-analytics%2F&docid=9Vol-eg3KIcREM&w=882&h=576&itg=1&q=Business%20Category%20News%20Image&ved=2ahUKEwjp74XR2J2AAxWuqGMGHfpiCqcQMygJegUIARCsAQ',
  'Health': 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cldnry.s-nbcnews.com%2Fimage%2Fupload%2Ft_focal-758x379%2Cf_auto%2Cq_auto%3Abest%2Frockcms%2F2022-11%2F221130-stock-doctor-talk-patient-ew-1221p-c1f1a2.jpg&tbnid=fyRBepZuipkjqM&vet=12ahUKEwjjk46e2Z2AAxUK5TgGHRYfAXUQMygRegUIARChAg..i&imgrefurl=https%3A%2F%2Fwww.nbcnews.com%2Fhealth%2Fhealth-care&docid=-AS2jnQ3o3aYyM&w=758&h=379&q=Health%20News%20Image&ved=2ahUKEwjjk46e2Z2AAxUK5TgGHRYfAXUQMygRegUIARChAg',
  'Science' : 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cldnry.s-nbcnews.com%2Fimage%2Fupload%2Ft_focal-758x379%2Cf_auto%2Cq_auto%3Abest%2Frockcms%2F2022-11%2F221130-stock-doctor-talk-patient-ew-1221p-c1f1a2.jpg&tbnid=fyRBepZuipkjqM&vet=12ahUKEwjjk46e2Z2AAxUK5TgGHRYfAXUQMygRegUIARChAg..i&imgrefurl=https%3A%2F%2Fwww.nbcnews.com%2Fhealth%2Fhealth-care&docid=-AS2jnQ3o3aYyM&w=758&h=379&q=Health%20News%20Image&ved=2ahUKEwjjk46e2Z2AAxUK5TgGHRYfAXUQMygRegUIARChAg',
  'Sports': 'https://static.toiimg.com/thumb/msid-73307467,width-400,resizemode-4/73307467.jpg',
  'Technology' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcBOOVaOsNvyvP7tUGKONViTNJ1jlOfZgmEw&usqp=CAU'
};
